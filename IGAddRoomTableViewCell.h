#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGAddRoomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UITextField *rightField;
@property (weak, nonatomic) IBOutlet UILabel *uniLabel;
+ (IGAddRoomTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
