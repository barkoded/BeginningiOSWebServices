#import <UIKit/UIKit.h>
#import "BKDPerson.h"

@interface BKDPlistViewController : UIViewController<NSURLConnectionDelegate>

@property (nonatomic, retain) BKDPerson *person;
@property (retain, nonatomic) IBOutlet UITextView *textView;

- (IBAction)execute:(id)sender;

@end