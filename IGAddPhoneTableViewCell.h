#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGAddPhoneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
+ (IGAddPhoneTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
