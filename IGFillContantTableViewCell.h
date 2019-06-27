#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGFillContantTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *optionLabel;
+ (IGFillContantTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
