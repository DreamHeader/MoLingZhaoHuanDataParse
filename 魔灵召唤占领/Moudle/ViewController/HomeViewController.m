//
//  HomeViewController.m
//  魔灵召唤占领
//
//  Created by Future on 2022/3/10.
//

#import "HomeViewController.h"
#import "BatteleBaseTableViewCell.h"
#import "ViewController.h"
#import "HistoryBattleViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UIButton * navImageView;
@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    [self createSubView];
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BatteleBaseTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"BatteleBaseTableViewCell" forIndexPath:indexPath];
    }
    cell.backgroundColor = UICOLOR_RGB(255, 255, 255, 0.8);
    cell.contentView.backgroundColor = UICOLOR_RGB(255, 255, 255, 0.8);
    cell.gonghuiNameLabel.adjustsFontSizeToFitWidth = YES;
    cell.attackRateLabel.text = self.dataSource[indexPath.section];
    cell.gonghuiNameLabel.hidden = YES;
    cell.attackCountLabel.hidden = YES;
    cell.currentScoreLabel.hidden = YES;
    cell.defenseBattleRateLabel.hidden = YES;
    return  cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     
    return  1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
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
    headerView.backgroundColor = UIColor.clearColor;
    return headerView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        ViewController * vc = [[ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else{
        HistoryBattleViewController * vc = [[HistoryBattleViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
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



-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainbg"]];
    }
    return  _imageView;
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
-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]initWithArray:@[@"当场战绩",@"历史战绩"]];
    }
    return  _dataSource;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
