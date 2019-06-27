#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGSettlementTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
+ (IGSettlementTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
