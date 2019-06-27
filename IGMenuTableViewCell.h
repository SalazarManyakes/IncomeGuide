#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGMenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *menuLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
+ (IGMenuTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
