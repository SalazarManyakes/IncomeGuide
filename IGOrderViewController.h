#import <UIKit/UIKit.h>
#import "IGOrderModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface IGOrderViewController : UIViewController
typedef void(^MenuBlock)(IGOrderModel * orderModel);
@property (nonatomic, copy) MenuBlock itemBlock;
@end
NS_ASSUME_NONNULL_END
