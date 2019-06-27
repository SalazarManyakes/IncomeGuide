#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGIncomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *roomLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageVIew;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLeftCons;
@property (nonatomic, weak) BSEventModel * model;
@property (nonatomic, weak) IGRoomModel * roomModel;
+ (IGIncomeTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
NS_ASSUME_NONNULL_END
