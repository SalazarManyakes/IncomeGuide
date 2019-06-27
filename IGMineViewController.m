#import "IGMineViewController.h"
#import "IGHeaderTableViewCell.h"
#import "IGMineTableViewCell.h"
#import "IGPersonViewController.h"
#import "IGOpinionViewController.h"
#import "IGAgreementViewController.h"
#import "MMCleanCacheManager.h"
#import "IGAboutMineViewController.h"
@interface IGMineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation IGMineViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Mine";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    [IGRootTabBarViewController incomeViewControlIncome:92 ];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
#pragma UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 150;
    } else {
        return 60;
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
        IGHeaderTableViewCell * cell = [IGHeaderTableViewCell cellWithTableView:tableView];
        cell.headerImageView.layer.masksToBounds = YES;
        if ([UIImage imageWithData:[JSUserInfo shareManager].header_image]) {
            cell.headerImageView.image = [UIImage imageWithData:[JSUserInfo shareManager].header_image];
        }
        if ([JSUserInfo shareManager].nickName) {
            cell.nickLabel.text = [JSUserInfo shareManager].nickName;
        }
        if ([JSUserInfo shareManager].signature) {
            cell.noteLabel.text = [JSUserInfo shareManager].signature;
        }
        return cell;
    } else {
        IGMineTableViewCell * cell = [IGMineTableViewCell cellWithTableView:tableView];
        if (indexPath.section==1) {
            cell.titleLabel.text = @"Clear the cache";
        } else if (indexPath.section==2) {
            cell.titleLabel.text = @"Feedback";
        } else if (indexPath.section==3) {
            cell.titleLabel.text = @"Privacy policy";
        } else {
            cell.titleLabel.text = @"About us";
        }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        IGPersonViewController * personVC = [[IGPersonViewController alloc]init];
        personVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:personVC animated:YES];
    } else {
        if (indexPath.section==1) {
            JSCommonAlertView *alter = [[JSCommonAlertView alloc]initWithTitle:@"Clear cache?"  textArray:nil textAlignment:TextAlignmentCenter buttonStyle:ButtonLandscapeStyle];
            [alter showAlertView:@"NO" sureTitle:@"YES" cancelBlock:^{
            } sureBlock:^{
                [[MMCleanCacheManager Cachesclear] clearAllCaches];
                [JSProgressHUD showSuccessWithStatus:@"Clear cache successful!"];
            }];
        } else if (indexPath.section==2) {
            IGOpinionViewController * personVC = [[IGOpinionViewController alloc]init];
            personVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:personVC animated:YES];
        } else if (indexPath.section==3) {
            IGAgreementViewController * personVC = [[IGAgreementViewController alloc]init];
            personVC.hidesBottomBarWhenPushed = YES;
            personVC.isMine = YES;
            [self.navigationController pushViewController:personVC animated:YES];
        } else {
            IGAboutMineViewController * personVC = [[IGAboutMineViewController alloc]init];
            personVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:personVC animated:YES];
        }
    }
}
@end
