#import "BKDEnvironment.h"

@implementation BKDEnvironment

@synthesize baseURL;

+ (BKDEnvironment*)sharedInstance 
{
    static dispatch_once_t predicate;
    static BKDEnvironment *sharedInstance = nil;

    NSString* configuration = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Configuration"];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Environments" ofType:@"plist"];
    NSDictionary* environments = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary* environment = [environments objectForKey:configuration];
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] initWithAttributes:environment];
    });
    [environments release];
    return sharedInstance;
}

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        baseURL = [[attributes valueForKey:@"baseURL"] retain];
    }
    return self;
}

- (void)dealloc {
    [baseURL release], baseURL = nil;
    [super dealloc];
}

@end
