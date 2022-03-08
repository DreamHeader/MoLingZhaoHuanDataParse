//
//  ViewController.m
//  gameBattle
//
//  Created by Future on 2022/2/17.
//

#import "ViewController.h"
#import "BatteleBaseTableViewCell.h"
#import "GameMemberPerInfo.h"
#import "MemberDetaiViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UIButton * navImageView;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) NSArray * titleNameArray;
@property (nonatomic,strong) UIButton * shareBtn;
@property (nonatomic,strong) UIImage * image;
@property (nonatomic,strong) NSMutableArray * memberDataSource;
@property (nonatomic,strong) NSMutableArray * otherGuildDataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleNameArray =  @[@[@"公会名称",@"战斗人数",@"进攻数量",@"当前分值",@"增长分值"],@[@"战斗双方(Attack)",@"战斗双方(Defense)",@"攻击占比",@"攻击成功",@"防守成功"]];
    self.view.backgroundColor = UIColor.whiteColor;
    [self createSubView];
    self.navigationController.navigationBar.hidden = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    self.shareBtn.frame = CGRectMake(SCREEN_WIDTH - 40 - 10 , 50, 40, 40);
    [self.view addSubview:self.shareBtn];
    self.otherGuildDataSource = [NSMutableArray arrayWithArray:[[GameDataManage shareManage]getOtherGuildInfo]];
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
    if (indexPath.section == 0) {
        cell.gonghuiNameLabel.textAlignment = NSTextAlignmentLeft;
        NSArray * dataSource = [[GameDataManage shareManage].dataModel.matchup_info.guild_list copy];
        if (indexPath.row < dataSource.count) {
            GameBattleGuildInfo * model = dataSource[indexPath.row];
            cell.gonghuiNameLabel.text = model.guild_name;
            double attackWinConunt = [[GameDataManage shareManage] getSelfGuildAttackCount];
            double totalAttackCount = model.attack_count;
            double attackWinRate = (attackWinConunt/ totalAttackCount)*100;
            cell.attackRateLabel.text =  [NSString stringWithFormat:@"%@",@(model.play_member_count)];
            cell.attackCountLabel.text = [NSString stringWithFormat:@"%@/250",@(model.attack_count)];
            cell.currentScoreLabel.text = [NSString stringWithFormat:@"%.f",model.match_score];
            cell.defenseBattleRateLabel.text = [NSString stringWithFormat:@"%ld/min",model.match_score_increment];
        }
    }else{
        cell.gonghuiNameLabel.textAlignment = NSTextAlignmentCenter;
        GameBattleGuildInfo * otherCurModel = nil;
        GameBattleGuildInfo * selfCurModel = [[GameDataManage shareManage]getSelfGuildInfo];
        if (indexPath.row < self.otherGuildDataSource.count) {
            otherCurModel = self.otherGuildDataSource[indexPath.row];
            cell.gonghuiNameLabel.text = [NSString stringWithFormat:@"%@",selfCurModel.guild_name];
            cell.attackRateLabel.text = [NSString stringWithFormat:@"%@",otherCurModel.guild_name];
            
            double attackTotalCount = [[GameDataManage shareManage]getGuildAttackOtherGuildData:selfCurModel.guild_id defenseGuildId:otherCurModel.guild_id type:0];
            double attackWinCount = [[GameDataManage shareManage]getGuildAttackOtherGuildData:selfCurModel.guild_id defenseGuildId:otherCurModel.guild_id type:1];
            double defenseTotalCount = [[GameDataManage shareManage]getGuildAttackOtherGuildData:selfCurModel.guild_id defenseGuildId:otherCurModel.guild_id type:2];
            double defenseWinCount = [[GameDataManage shareManage]getGuildAttackOtherGuildData:selfCurModel.guild_id defenseGuildId:otherCurModel.guild_id type:3];
            
            cell.attackCountLabel.text = [NSString stringWithFormat:@"%@/%@ (%.f%@)",@(attackTotalCount),@(selfCurModel.attack_count),attackTotalCount/selfCurModel.attack_count*100,@"%"];
            cell.currentScoreLabel.text = [NSString stringWithFormat:@"%@/%@(%.f%@)",@(attackWinCount),@(attackTotalCount),attackWinCount/attackTotalCount*100,@"%"];
            cell.defenseBattleRateLabel.text = [NSString stringWithFormat:@"%@/%@ (%.f%@)",@(defenseWinCount),@(defenseTotalCount),defenseWinCount/defenseTotalCount*100,@"%"];
        }else{
            if ((indexPath.row - self.otherGuildDataSource.count) <= self.otherGuildDataSource.count) {
                otherCurModel = self.otherGuildDataSource[(indexPath.row - self.otherGuildDataSource.count)];
                cell.gonghuiNameLabel.text = [NSString stringWithFormat:@"%@",otherCurModel.guild_name];
                cell.attackRateLabel.text = [NSString stringWithFormat:@"%@",selfCurModel.guild_name];
                
                double attackTotalCount = [[GameDataManage shareManage]getGuildAttackOtherGuildData:otherCurModel.guild_id defenseGuildId:selfCurModel.guild_id type:0];
                double attackWinCount = [[GameDataManage shareManage]getGuildAttackOtherGuildData:otherCurModel.guild_id defenseGuildId:selfCurModel.guild_id type:1];
                double defenseTotalCount = [[GameDataManage shareManage]getGuildAttackOtherGuildData:otherCurModel.guild_id defenseGuildId:selfCurModel.guild_id type:2];
                double defenseWinCount = [[GameDataManage shareManage]getGuildAttackOtherGuildData:otherCurModel.guild_id defenseGuildId:selfCurModel.guild_id type:3];
                
                cell.attackCountLabel.text = [NSString stringWithFormat:@"%@/%@ (%.f%@)",@(attackTotalCount),@(otherCurModel.attack_count),attackTotalCount/otherCurModel.attack_count*100,@"%"];
                cell.currentScoreLabel.text = [NSString stringWithFormat:@"%@/%@(%.f%@)",@(attackWinCount),@(attackTotalCount),attackWinCount/attackTotalCount*100,@"%"];
                cell.defenseBattleRateLabel.text = [NSString stringWithFormat:@"%@/%@ (%.f%@)",@(defenseWinCount),@(defenseTotalCount),defenseWinCount/defenseTotalCount*100,@"%"];
            }
        }
    }
    return  cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 0 ? 20 : 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 20)];
    return  footerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, 40)];
    headerView.backgroundColor = UICOLOR_RGB(247, 142, 21, 0.8);
    CGFloat width = (SCREEN_WIDTH - 20 )/5.0;
    NSArray * curTitleArr = self.titleNameArray[section];
    for (int i = 0; i < curTitleArr.count; i++) {
        NSString * name = curTitleArr[i];
        UILabel*label = [[UILabel alloc]init];
        label.text = name;
        label.textColor = UIColor.blackColor;
        label.alpha = 0.6;
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(width*i, 0, width, 40);
        [headerView addSubview:label];
    }
    return headerView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.titleNameArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return self.otherGuildDataSource.count*2;
    }
    return  [GameDataManage shareManage].dataModel.matchup_info.guild_list.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    if (indexPath.section == 0) {
        MemberDetaiViewController * vc = [[MemberDetaiViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)showBattleDataImage:(UIButton*)sender{
    self.image = [self screenshotForView:self.tableView];
    
    if (self.image) {
        UIImageWriteToSavedPhotosAlbum(self.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }
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
        _memberDataSource = [[NSMutableArray alloc]initWithArray:[[GameDataManage shareManage] getSetUpTotalMemberInfo]];
    }
    return  _memberDataSource;
}

@end
