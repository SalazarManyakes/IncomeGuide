#import "IGRoomViewController.h"
#import "IGRoomTableViewCell.h"
#import "IGAddRoomViewController.h"
#import "IGUseViewController.h"
@interface IGRoomViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<BSEventModel*> * dataArr;
@end
@implementation IGRoomViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"HOME";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"tianjia"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(addRoomClick)];
    [IGAgreementViewController agreeDelegateBtnIncome:102];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.dataArr = [JSUserInfo shareManager].eventArr;
    [self.tableView reloadData];
}
-(void)addRoomClick{
    IGAddRoomViewController * addRoomVC = [[IGAddRoomViewController alloc]init];
    addRoomVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addRoomVC animated:YES];
}
#pragma UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataArr.count==0) {
        [self.tableView showEmptyView];
    } else {
        [self.tableView hideEmptyView];
    }
    return self.dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 15)];
    bgView.backgroundColor = [UIColor clearColor];
    return bgView;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BSEventModel * model = self.dataArr[indexPath.section];
    IGRoomTableViewCell * cell = [IGRoomTableViewCell cellWithTableView:tableView];
    cell.model = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BSEventModel * model = self.dataArr[indexPath.section];
    IGUseViewController * addPasswordVC = [[IGUseViewController alloc]init];
    addPasswordVC.hidesBottomBarWhenPushed = YES;
    addPasswordVC.isState = model.isState;
    addPasswordVC.index_count = indexPath.section;
    addPasswordVC.model = model;
    [self.navigationController pushViewController:addPasswordVC animated:YES];
}
@end
