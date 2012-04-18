#import <Foundation/Foundation.h>

@interface BKDEnvironment : NSObject

@property (nonatomic, readonly, retain) NSString *baseURL;

+ (BKDEnvironment*)sharedInstance;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
