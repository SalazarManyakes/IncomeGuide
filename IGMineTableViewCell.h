#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGMineTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
+ (IGMineTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
