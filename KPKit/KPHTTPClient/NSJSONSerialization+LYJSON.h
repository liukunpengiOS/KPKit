
#import <Foundation/Foundation.h>

@interface NSJSONSerialization (LYJSON)

+ (nullable NSString *)stringWithJSONObject:(nonnull id)JSONObject;

+ (nullable id)objectWithJSONString:(nonnull NSString *)JSONString;

+ (nullable id)objectWithJSONData:(nonnull NSData *)JSONData;

@end
