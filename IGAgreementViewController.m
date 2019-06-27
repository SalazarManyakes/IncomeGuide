#import "IGAgreementViewController.h"
#import "IGRootTabBarViewController.h"
@interface IGAgreementViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeightCons;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
@implementation IGAgreementViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Privacy policy";
    self.textView.delegate = self;
    if (self.isMine) {
        self.bottomHeightCons.constant = 0;
    } else {
        self.bottomHeightCons.constant = 50;
    }
    [self.agreeBtn setTitle:@"Agreed" forState:UIControlStateNormal];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}
- (IBAction)agreeDelegateBtn:(UIButton *)sender {
    [JSUserInfo shareManager].token = @"token_key";
    IGRootTabBarViewController* control = [IGRootTabBarViewController shareInstance];
    KEY_WINDOW.rootViewController = control;
    [KEY_WINDOW makeKeyAndVisible];
}
@end
