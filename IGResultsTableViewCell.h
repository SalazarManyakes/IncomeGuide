#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGResultsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;
@property (weak, nonatomic) IBOutlet UILabel *useLabel;
@property (weak, nonatomic) IBOutlet UILabel *roomPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherLabel;
+ (IGResultsTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
