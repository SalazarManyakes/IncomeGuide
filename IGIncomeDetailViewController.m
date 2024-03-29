#import "IGIncomeDetailViewController.h"
#import "IGIncomeDetailTableViewCell.h"
@interface IGIncomeDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation IGIncomeDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Details";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
#pragma UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
    IGIncomeDetailTableViewCell * cell = [IGIncomeDetailTableViewCell cellWithTableView:tableView];
    if (indexPath.section==0) {
        cell.leftLabel.text = @"Total Income";
        cell.rightLabel.text = self.model.total_price;
    } else if (indexPath.section==1) {
        cell.leftLabel.text = @"Start time";
        cell.rightLabel.text = self.model.start_time;
    } else if (indexPath.section==2) {
        cell.leftLabel.text = @"End time";
        cell.rightLabel.text = self.model.end_time;
    } else if (indexPath.section==3) {
        cell.leftLabel.text = @"Use time";
        cell.rightLabel.text = self.model.time_leng;
    } else if (indexPath.section==4) {
        cell.leftLabel.text = @"Home charge";
        cell.rightLabel.text = self.model.room_price;
    } else {
        cell.leftLabel.text = @"Other consumer";
        cell.rightLabel.text = self.model.other_price;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
@end
