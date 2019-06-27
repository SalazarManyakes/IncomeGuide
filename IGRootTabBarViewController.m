#import "IGRootTabBarViewController.h"
#import "IGRoomViewController.h"
#import "IGMineViewController.h"
#import "IGIncomeViewController.h"
@interface IGRootTabBarViewController ()<UITabBarControllerDelegate>
@property(strong,nonatomic) IGRoomViewController * passwordViewControl;
@property(strong,nonatomic) IGIncomeViewController * incomeViewControl;
@property(strong,nonatomic) IGMineViewController * mineViewControl;
@end
@implementation IGRootTabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = SMColorFromRGB(0x787DB1);
    [self prepareSubViews];
    self.delegate = self;
}
+(instancetype)shareInstance
{
    static IGRootTabBarViewController* rootTabbar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rootTabbar = [IGRootTabBarViewController new];
    });
    return rootTabbar;
}
#pragma mark - Delegate & DataSource
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if([item.title isEqualToString:@""]){
    }
}
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if([tabBarController.viewControllers indexOfObject:viewController] == 1){
    }
    return YES;
}
#pragma mark - 初始化子视图
-(void)prepareSubViews
    {
    [self rootMainSubViews];
}
-(void)rootMainSubViews
{
    UINavigationController* gamesNav = [[UINavigationController alloc]initWithRootViewController:self.passwordViewControl];
    UINavigationController* incomeNav = [[UINavigationController alloc]initWithRootViewController:self.incomeViewControl];
    UINavigationController* mineNav = [[UINavigationController alloc]initWithRootViewController:self.mineViewControl];
    self.viewControllers = @[gamesNav,incomeNav,mineNav];
}
#pragma mark - getter & setter
-(IGRoomViewController *)passwordViewControl
{
    if(_passwordViewControl==nil){
        _passwordViewControl = [IGRoomViewController new];
        _passwordViewControl.tabBarItem.title = @"HOME";
        _passwordViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"room_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _passwordViewControl.tabBarItem.image = [[UIImage imageNamed:@"room_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _passwordViewControl;
}
-(IGIncomeViewController *)incomeViewControl{
    if(_incomeViewControl==nil){
        _incomeViewControl = [IGIncomeViewController new];
        _incomeViewControl.tabBarItem.title = @"Income";
        _incomeViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"income_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _incomeViewControl.tabBarItem.image = [[UIImage imageNamed:@"income_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _incomeViewControl;
}
-(IGMineViewController *)mineViewControl
{
    if(_mineViewControl==nil){
        _mineViewControl = [IGMineViewController new];
        _mineViewControl.tabBarItem.title = @"Mine";
        _mineViewControl.tabBarItem.selectedImage = [[UIImage imageNamed:@"wode_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _mineViewControl.tabBarItem.image = [[UIImage imageNamed:@"wode_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _mineViewControl;
}
@end
