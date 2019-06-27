#import "IGRoomIncomeViewController.h"
#import "IGIncomeTableViewCell.h"
#import "IGIncomeDetailViewController.h"
@interface IGRoomIncomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation IGRoomIncomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.title;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    return 80;
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
    IGRoomModel * model = self.dataArr[indexPath.section];
    IGIncomeTableViewCell * cell = [IGIncomeTableViewCell cellWithTableView:tableView];
    cell.roomModel = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        IGRoomModel * model = self.dataArr[indexPath.section];
        IGIncomeDetailViewController * addPasswordVC = [[IGIncomeDetailViewController alloc]init];
        addPasswordVC.hidesBottomBarWhenPushed = YES;
        addPasswordVC.model = model;
        [self.navigationController pushViewController:addPasswordVC animated:YES];
}
@end
