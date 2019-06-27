#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGAddEventTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UITextField *rightField;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightHeightCons;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
+ (IGAddEventTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
