#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface IGOrderModel : NSObject
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * price;
@property (nonatomic, copy) NSString * note;
- (instancetype)init;
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
@end
NS_ASSUME_NONNULL_END
