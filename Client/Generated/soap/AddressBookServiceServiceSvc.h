#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class AddressBookServiceServiceSvc_getPerson;
@class AddressBookServiceServiceSvc_getPersonResponse;
@class AddressBookServiceServiceSvc_person;
@class AddressBookServiceServiceSvc_phoneNumber;
@interface AddressBookServiceServiceSvc_getPerson : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (AddressBookServiceServiceSvc_getPerson *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
typedef enum {
	AddressBookServiceServiceSvc_phoneType_none = 0,
	AddressBookServiceServiceSvc_phoneType_mobile,
	AddressBookServiceServiceSvc_phoneType_home,
	AddressBookServiceServiceSvc_phoneType_work,
} AddressBookServiceServiceSvc_phoneType;
AddressBookServiceServiceSvc_phoneType AddressBookServiceServiceSvc_phoneType_enumFromString(NSString *string);
NSString * AddressBookServiceServiceSvc_phoneType_stringFromEnum(AddressBookServiceServiceSvc_phoneType enumValue);
@interface AddressBookServiceServiceSvc_phoneNumber : NSObject {
	
/* elements */
	NSString * phoneNumber;
	AddressBookServiceServiceSvc_phoneType type;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (AddressBookServiceServiceSvc_phoneNumber *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * phoneNumber;
@property (assign) AddressBookServiceServiceSvc_phoneType type;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface AddressBookServiceServiceSvc_person : NSObject {
	
/* elements */
	NSNumber * id_;
	NSString * name;
	NSString * email;
	AddressBookServiceServiceSvc_phoneNumber * phoneNumber;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (AddressBookServiceServiceSvc_person *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSNumber * id_;
@property (retain) NSString * name;
@property (retain) NSString * email;
@property (retain) AddressBookServiceServiceSvc_phoneNumber * phoneNumber;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface AddressBookServiceServiceSvc_getPersonResponse : NSObject {
	
/* elements */
	AddressBookServiceServiceSvc_person * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (AddressBookServiceServiceSvc_getPersonResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) AddressBookServiceServiceSvc_person * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xs.h"
#import "AddressBookServiceServiceSvc.h"
@class AddressBookServiceServiceSoapBinding;
@interface AddressBookServiceServiceSvc : NSObject {
	
}
+ (AddressBookServiceServiceSoapBinding *)AddressBookServiceServiceSoapBinding;
@end
@class AddressBookServiceServiceSoapBindingResponse;
@class AddressBookServiceServiceSoapBindingOperation;
@protocol AddressBookServiceServiceSoapBindingResponseDelegate <NSObject>
- (void) operation:(AddressBookServiceServiceSoapBindingOperation *)operation completedWithResponse:(AddressBookServiceServiceSoapBindingResponse *)response;
@end
@interface AddressBookServiceServiceSoapBinding : NSObject <AddressBookServiceServiceSoapBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(AddressBookServiceServiceSoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (AddressBookServiceServiceSoapBindingResponse *)getPersonUsingParameters:(AddressBookServiceServiceSvc_getPerson *)aParameters ;
- (void)getPersonAsyncUsingParameters:(AddressBookServiceServiceSvc_getPerson *)aParameters  delegate:(id<AddressBookServiceServiceSoapBindingResponseDelegate>)responseDelegate;
@end
@interface AddressBookServiceServiceSoapBindingOperation : NSOperation {
	AddressBookServiceServiceSoapBinding *binding;
	AddressBookServiceServiceSoapBindingResponse *response;
	id<AddressBookServiceServiceSoapBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) AddressBookServiceServiceSoapBinding *binding;
@property (readonly) AddressBookServiceServiceSoapBindingResponse *response;
@property (nonatomic, assign) id<AddressBookServiceServiceSoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(AddressBookServiceServiceSoapBinding *)aBinding delegate:(id<AddressBookServiceServiceSoapBindingResponseDelegate>)aDelegate;
@end
@interface AddressBookServiceServiceSoapBinding_getPerson : AddressBookServiceServiceSoapBindingOperation {
	AddressBookServiceServiceSvc_getPerson * parameters;
}
@property (retain) AddressBookServiceServiceSvc_getPerson * parameters;
- (id)initWithBinding:(AddressBookServiceServiceSoapBinding *)aBinding delegate:(id<AddressBookServiceServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(AddressBookServiceServiceSvc_getPerson *)aParameters
;
@end
@interface AddressBookServiceServiceSoapBinding_envelope : NSObject {
}
+ (AddressBookServiceServiceSoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface AddressBookServiceServiceSoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
