#import "Product.h"


@interface Product ()

@end


@implementation Product

- (id)initWitName:(NSString *)name withPrice:(NSNumber *)price {
  
  self = [super init];
  if (self) {
    _name = name;
    _price = price;
  }
  return self;
}

@end
