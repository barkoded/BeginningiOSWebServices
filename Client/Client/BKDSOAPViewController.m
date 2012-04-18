#import "BKDSOAPViewController.h"
#import "BKDEnvironment.h"
#import "UIApplication+BKDNetworkActivity.h"

@implementation BKDSOAPViewController

@synthesize person;
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"SOAP", @"SOAP");
        self.tabBarItem.image = [UIImage imageNamed:@"person"];
    }
    return self;
}

-(void)dealloc
{
    [person release], person = nil;
    [textView release], textView = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - AddressBookServiceServiceSoapBindingResponseDelegate Methods

- (void) operation:(AddressBookServiceServiceSoapBindingOperation *)operation completedWithResponse:(AddressBookServiceServiceSoapBindingResponse *)response
{
    [[UIApplication sharedApplication] bkd_popNetworkActivity];
       
    NSArray *responseHeaders = response.headers;
    NSArray *responseBodyParts = response.bodyParts;
    
    for(id header in responseHeaders) {
        // here do what you want with the headers, if there's anything of value in them
    }
    
    for(id bodyPart in responseBodyParts) {
        /****
         * SOAP Fault Error
         ****/
        if ([bodyPart isKindOfClass:[SOAPFault class]]) {
            // You can get the error like this:
            NSLog(@"Fault: %@", ((SOAPFault *)bodyPart).simpleFaultString);
            continue;
        }
        
        /****
         * Get Person Name
         ****/          
        if([bodyPart isKindOfClass:[AddressBookServiceServiceSvc_getPersonResponse class]]) {
            AddressBookServiceServiceSvc_getPersonResponse *body = (AddressBookServiceServiceSvc_getPersonResponse*)bodyPart;
            
            DLog(@"Succeeded! Received SOAP %@", body.description);
            self.textView.text = [NSString stringWithFormat:@"%@", body.description];

            AddressBookServiceServiceSvc_person *p = [body return_];
            
            self.person = [[BKDPerson alloc] initWithSOAPAttributes:p];
            DLog(@"Succeeded! Created person based on SOAP %@", person);
            continue;
        }
    }
}


- (IBAction)execute:(id)sender {
    self.textView.text = @"";
    
    AddressBookServiceServiceSoapBinding *binding = [[AddressBookServiceServiceSoapBinding alloc] initWithAddress:[NSString stringWithFormat:@"%@/%@", [[BKDEnvironment sharedInstance] baseURL], @"soap"]];    
    binding.logXMLInOut = YES;
    
    AddressBookServiceServiceSvc_getPerson *request = [[AddressBookServiceServiceSvc_getPerson new] autorelease];
    [binding getPersonAsyncUsingParameters:request delegate:self];
    
    [[UIApplication sharedApplication] bkd_pushNetworkActivity];
    [binding release];
}
@end
