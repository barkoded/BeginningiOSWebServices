#import "BKDPerson.h"
#import "BKDPhoneNumber.h"
#import "AddressBookServiceServiceSvc.h"

@implementation BKDPerson

@synthesize identifier;
@synthesize name;
@synthesize email;
@synthesize phoneNumber;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        identifier = [[attributes valueForKeyPath:@"id"] copy];
        name = [[attributes valueForKeyPath:@"name"] copy];
        email = [[attributes valueForKeyPath:@"email"] copy];
        phoneNumber = [[BKDPhoneNumber alloc] initWithAttributes:[attributes valueForKeyPath:@"phone"]];
    }
    return self;
}

- (id)initWithSOAPAttributes:(AddressBookServiceServiceSvc_person *)person
{
    self = [super init];
    if (self) {
        identifier = [[person id_] copy];
        name = [[person name] copy];
        email = [[person email] copy];
        phoneNumber = [[[BKDPhoneNumber alloc] initWithSOAPAttributes:[person phoneNumber]] retain];
    }
    return self;

}

-(void)dealloc
{
    [identifier release], identifier = nil;
    [name release], name = nil;
    [email release], email = nil;
    [phoneNumber release], phoneNumber = nil;
    [super dealloc];
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"[identifier: %@, name: %@, email: %@]", identifier, name, email];
}

@end
