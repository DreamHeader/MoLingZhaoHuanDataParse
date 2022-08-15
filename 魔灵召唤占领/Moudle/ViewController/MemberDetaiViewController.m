//
//  MemberDetaiViewController.m
//  魔灵召唤占领
//
//  Created by Future on 2022/3/2.
//

#import "MemberDetaiViewController.h"
#import "BatteleBaseTableViewCell.h"
#import "GameMemberPerInfo.h"
@interface MemberDetaiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UIButton * navImageView;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) NSArray * titleNameArray;
@property (nonatomic,strong) UIButton * shareBtn;
@property (nonatomic,strong) UIButton * backBtn;
@property (nonatomic,strong) UIImage * image;
@property (nonatomic,strong) NSMutableArray * memberDataSource;

@end

@implementation MemberDetaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"据点成员数据";
    self.titleNameArray =  @[@[@"公会成员",@"胜利",@"贡献度",@"已出刀",@"防守成功"]];
    self.view.backgroundColor = UIColor.whiteColor;
    [self createSubView];
     
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
    [self sortMemberDataSource];
    // Do any additional setup after loading the view.
}
-(void)createSubView {
    [self.view addSubview:self.imageView];
    self.navImageView.backgroundColor = UIColor.clearColor;
    self.navImageView.frame = CGRectMake((SCREEN_WIDTH - 40)/2, 50, 40, 40);
    [self.view addSubview:self.navImageView];
    self.imageView.frame = self.view.bounds;
    self.imageView.alpha = 0.4;
    [self.view addSubview:self.tableView];
    self.shareBtn.frame = CGRectMake(SCREEN_WIDTH - 40 - 10 , 50, 40, 40);
    [self.view addSubview:self.shareBtn];
    self.backBtn.frame = CGRectMake(15 , 50, 70, 70);
    [self.view addSubview:self.backBtn];
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH - 20, SCREEN_Height - 150) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.layer.masksToBounds = YES;
        _tableView.layer.cornerRadius = 10;
        _tableView.backgroundColor = UIColor.clearColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"BatteleBaseTableViewCell" bundle:nil] forCellReuseIdentifier:@"BatteleBaseTableViewCell"];
        
    }
    return _tableView;
    
}
-(double)getAttackWinCount{
    double count = 0;
    for (GameMemberPerInfo* model in self.memberDataSource) {
        count += model.attact_win_count;
    }
    return  count;
}
-(double)getDefenseWinCount{
    double count = 0;
    for (GameMemberPerInfo* model in self.memberDataSource) {
        count += model.defense_win_count;
    }
    return  count;
}
-(void)sortMemberDataSource{
    //用这个方法
    NSArray * array = [self.memberDataSource sortedArrayUsingComparator:^NSComparisonResult(GameMemberPerInfo *  _Nonnull obj1, GameMemberPerInfo *  _Nonnull obj2) {
        if (obj1.battleScore > obj2.battleScore) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    self.memberDataSource = [NSMutableArray arrayWithArray:array];
    [self.tableView reloadData];
}
#pragma mark - UITableViewDelegate&&UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BatteleBaseTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"BatteleBaseTableViewCell" forIndexPath:indexPath];
    }
    cell.backgroundColor = UICOLOR_RGB(255, 255, 255, 0.8);
    cell.contentView.backgroundColor = UICOLOR_RGB(255, 255, 255, 0.8);
    cell.gonghuiNameLabel.adjustsFontSizeToFitWidth = YES;
    
    NSArray * memberInfoArr = [self.memberDataSource copy];
    if (indexPath.row < memberInfoArr.count){
        GameMemberPerInfo * model = memberInfoArr[indexPath.row];
        cell.gonghuiNameLabel.text = [NSString stringWithFormat:@"%@. %@",@(indexPath.row + 1),model.wizard_name] ;
        double attactWin = model.attact_win_count;
        double attactTotal = model.attact_total_count;
        double attackRate = (attactTotal == 0 ? 0 :  attactWin/attactTotal*100);
        cell.attackRateLabel.text = [NSString stringWithFormat:@"%@/%@  (%.f%@)",@(model.attact_win_count),@(attactTotal),attackRate,@"%"];
        cell.attackCountLabel.text = [NSString stringWithFormat:@"%@",@(model.battleScore)];
        cell.currentScoreLabel.text = [NSString stringWithFormat:@"%@/10",@(model.attact_total_count)];
        cell.defenseBattleRateLabel.text = [NSString stringWithFormat:@"%@/%@",@(model.defense_win_count),@(model.defense_total_count)];
        cell.attackRateLabel.textColor = attackRate >= 70 ? UIColor.blackColor : UIColor.redColor;
        cell.attackCountLabel.textColor = attackRate >= 70 ? UIColor.blackColor : UIColor.redColor;
        cell.currentScoreLabel.textColor = attackRate >= 70 ? UIColor.blackColor : UIColor.redColor;
        cell.defenseBattleRateLabel.textColor = attackRate >= 70 ? UIColor.blackColor : UIColor.redColor;
        cell.gonghuiNameLabel.textColor = attackRate >= 70 ? UIColor.blackColor : UIColor.redColor;
    }
    
    return  cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 0 ? 20 : 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 20)];
    return  footerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, 80)];
    headerView.backgroundColor = UICOLOR_RGB(247, 142, 21, 0.8);
    CGFloat width = (SCREEN_WIDTH - 20 )/5.0;
    NSArray * curTitleArr = self.titleNameArray[section];
    for (int i = 0; i < curTitleArr.count; i++) {
        if (i == 0) {
            double totalAttackCount = [[GameDataManage shareManage]getSelfGuildInfo].attack_count;
            double winAttackCount = [self getAttackWinCount];
            NSString * name = [NSString stringWithFormat:@"整体进攻胜率：%.f%@",winAttackCount/totalAttackCount*100,@"%"];
            UILabel*label = [[UILabel alloc]init];
            label.text = name;
            label.textColor = UIColor.blueColor;
            label.alpha = 0.6;
            label.backgroundColor = UIColor.redColor;
            label.font = [UIFont boldSystemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(width*i, 0, width, 40);
            [headerView addSubview:label];
        }
        NSString * name = curTitleArr[i];
        UILabel*label = [[UILabel alloc]init];
        label.text = name;
        label.textColor = UIColor.blackColor;
        label.alpha = 0.6;
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(width*i, 40, width, 40);
        [headerView addSubview:label];
    }
    return headerView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return   self.memberDataSource.count > 25 ? 25 : self.memberDataSource.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
}

-(void)showBattleDataImage:(UIButton*)sender{
    self.image = [self screenshotForView:self.tableView];
    
    if (self.image) {
        UIImageWriteToSavedPhotosAlbum(self.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }
}
-(void)clickBackBtn:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
// 指定回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(!error){
        NSLog(@"save success");
    }else{
        NSLog(@"save failed");
    }
}
- (UIImage *)screenshotForView:(UIView *)view {
    UIImage *image = nil;
    
    //判断View类型（一般不是滚动视图或者其子类的话内容不会超过一屏，当然如果超过了也可以通过修改frame来实现绘制）
    if ([view.class isSubclassOfClass:[UIScrollView class]]) {
        UIScrollView *scrView = (UIScrollView *)view;
        
        CGPoint tempContentOffset = scrView.contentOffset;
        CGRect tempFrame = scrView.frame;
        
        scrView.contentOffset = CGPointZero;
        scrView.frame = CGRectMake(-6, 5, scrView.contentSize.width+3, scrView.contentSize.height-120);
        
        image = [self screenshotForView:scrView size:scrView.frame.size];
        
        scrView.contentOffset = tempContentOffset;
        scrView.frame = tempFrame;
        
    } else {
        CGRect frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height-65);
        //CGSize size = CGSizeMake(view.frame.size.width, view.frame.size.height-150);
        //view.frame = frame;
        image = [self screenshotForView:view size:frame.size];
    }
    
    return image;
}

- (UIImage *)screenshotForView:(UIView *)view size:(CGSize)size {
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}
#pragma mark - Lazy load

-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"r_music_close"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _backBtn;
}
-(UIButton *)shareBtn{
    if (!_shareBtn) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setImage:[UIImage imageNamed:@"popTip_set"] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(showBattleDataImage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _shareBtn;
}
-(UIButton *)navImageView{
    if (!_navImageView) {
        _navImageView = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [_navImageView setTitle:@"魔灵召唤" forState:UIControlStateNormal];
        _navImageView.titleLabel.font = [UIFont systemFontOfSize:12];
        [_navImageView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_navImageView setImage:[UIImage imageNamed:@"molingFlag"] forState:UIControlStateNormal];
    }
    return  _navImageView;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainbg"]];
    }
    return  _imageView;
}
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return  _dataSource;
}
-(NSMutableArray *)memberDataSource{
    if (!_memberDataSource) {
        _memberDataSource = [[NSMutableArray alloc]initWithArray:[[GameDataManage shareManage] getMachUpTotalMemberInfo]];
    }
    return  _memberDataSource;
}

@end
