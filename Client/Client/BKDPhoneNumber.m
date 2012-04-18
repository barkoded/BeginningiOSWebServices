#import "BKDPhoneNumber.h"
#import "AddressBookServiceServiceSvc.h"

@implementation BKDPhoneNumber

@synthesize number;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        number = [[attributes valueForKeyPath:@"number"] copy];
    }
    return self;
}

- (id)initWithSOAPAttributes:(AddressBookServiceServiceSvc_phoneNumber *)phoneNumber
{
    self = [super init];
    if (self) {
        number = [[phoneNumber phoneNumber] copy];
    }
    return self;
}

- (void)dealloc
{
    [number release], number = nil;
    [super dealloc];
}

@end
