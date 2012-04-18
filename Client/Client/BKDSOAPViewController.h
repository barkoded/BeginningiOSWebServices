#import <UIKit/UIKit.h>
#import "AddressBookServiceServiceSvc.h"
#import "BKDPerson.h"

@interface BKDSOAPViewController : UIViewController<AddressBookServiceServiceSoapBindingResponseDelegate>

@property (nonatomic, retain) BKDPerson *person;
@property (retain, nonatomic) IBOutlet UITextView *textView;

- (IBAction)execute:(id)sender;

@end
