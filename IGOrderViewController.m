#import "IGOrderViewController.h"
#import "IGAddRoomTableViewCell.h"
@interface IGOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (nonatomic, strong) IGOrderModel * orderModel;
@end
@implementation IGOrderViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Order";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.saveBtn.layer.cornerRadius = 25;
    self.saveBtn.layer.masksToBounds = YES;
    self.view.backgroundColor = self.tableView.backgroundColor;
}
- (IBAction)saveOrderClick:(UIButton *)sender {
    if (self.orderModel.name.length==0) {
        [JSProgressHUD showInfoWithStatus:NSLocalizedString(@"Please enter the name of the product", nil)];
        return;
    }
    if (self.orderModel.price.length==0) {
        [JSProgressHUD showInfoWithStatus:NSLocalizedString(@"Please enter the price", nil)];
        return;
    }
    if (self.orderModel) {
        self.itemBlock(self.orderModel);
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
    @weakify(self);
    IGAddRoomTableViewCell * cell = [IGAddRoomTableViewCell cellWithTableView:tableView];
    if (indexPath.section==0) {
        cell.leftLabel.text = @"Goods";
        cell.rightField.placeholder = @"Please enter the name of the product";
        if (self.orderModel.name.length>0) {
            cell.rightField.text = self.orderModel.name;
        }
        [[cell.rightField rac_textSignal]subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
            self.orderModel.name = x;
        }];
    } else if (indexPath.section==1) {
        cell.leftLabel.text = @"Price";
        cell.rightField.placeholder = @"Please enter the price";
        cell.rightField.keyboardType = UIKeyboardTypeNumberPad;
        if (self.orderModel.price.length>0) {
            cell.rightField.text = self.orderModel.price;
        }
        [[cell.rightField rac_textSignal]subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
            self.orderModel.price = x;
        }];
    } else {
        cell.leftLabel.text = @"Note";
        cell.rightField.placeholder = @"Please enter remarks";
        if (self.orderModel.note.length>0) {
            cell.rightField.text = self.orderModel.note;
        }
        [[cell.rightField rac_textSignal]subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
            self.orderModel.note = x;
        }];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}
-(IGOrderModel *)orderModel{
    if (!_orderModel) {
        _orderModel = [[IGOrderModel alloc]init];
    }
    return _orderModel;
}
@end
