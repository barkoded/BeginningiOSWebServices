#import <Foundation/Foundation.h>

@class AddressBookServiceServiceSvc_phoneNumber;

@interface BKDPhoneNumber : NSObject

@property (nonatomic, retain) NSString *number;

- (id)initWithAttributes:(NSDictionary *)attributes;

- (id)initWithSOAPAttributes:(AddressBookServiceServiceSvc_phoneNumber *)phoneNumber;

@end
