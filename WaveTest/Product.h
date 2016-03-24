#import <Foundation/Foundation.h>


@interface Product : NSObject

- (id)initWitName:(NSString *)name withPrice:(NSNumber *)price;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *price;

@end
