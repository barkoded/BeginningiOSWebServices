#import <Foundation/Foundation.h>

@class BKDPhoneNumber;
@class AddressBookServiceServiceSvc_person;

@interface BKDPerson : NSObject

@property (nonatomic, retain) NSNumber *identifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) BKDPhoneNumber *phoneNumber;

- (id)initWithAttributes:(NSDictionary *)attributes;

- (id)initWithSOAPAttributes:(AddressBookServiceServiceSvc_person *)person;

@end
