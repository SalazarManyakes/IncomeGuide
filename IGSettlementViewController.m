#import "IGSettlementViewController.h"
#import "IGResultsTableViewCell.h"
#import "IGSettlementTableViewCell.h"
@interface IGSettlementViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *completeBtn;
@end
@implementation IGSettlementViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Settlement";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.completeBtn.layer.cornerRadius = 25;
    self.completeBtn.layer.masksToBounds = YES;
    self.view.backgroundColor = self.tableView.backgroundColor;
    self.navigationItem.hidesBackButton = YES;
}
- (IBAction)completeSettlementClick:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 200;
    } else {
        return 150;
    }
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
    if (indexPath.section==0) {
        IGSettlementTableViewCell * cell = [IGSettlementTableViewCell cellWithTableView:tableView];
        cell.totalLabel.text = self.roomModel.total_price;
        return cell;
    } else {
        IGResultsTableViewCell * cell = [IGResultsTableViewCell cellWithTableView:tableView];
        cell.startLabel.text = self.roomModel.start_time;
        cell.endLabel.text = self.roomModel.end_time;
        cell.useLabel.text = self.roomModel.time_leng;
        cell.roomPriceLabel.text = self.roomModel.room_price;
        cell.otherLabel.text = self.roomModel.other_price;
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
@end
