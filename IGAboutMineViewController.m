#import "IGAboutMineViewController.h"
@interface IGAboutMineViewController ()
@end
@implementation IGAboutMineViewController
- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationItem.title = @"About us";
    [IGOrderViewController orderModelIncome:12];
}
@end
