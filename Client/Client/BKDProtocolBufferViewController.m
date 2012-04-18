#import "BKDProtocolBufferViewController.h"
#import "BKDEnvironment.h"
#import "UIApplication+BKDNetworkActivity.h"
#import "Addressbook.pb.h"

@interface BKDProtocolBufferViewController ()
@property (nonatomic, retain) NSMutableData *receivedData;
@end

@implementation BKDProtocolBufferViewController

@synthesize receivedData;
@synthesize person;
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"ProtoBuf", @"Protocol Buffer");
        self.tabBarItem.image = [UIImage imageNamed:@"person"];
    }
    return self;
}

-(void)dealloc
{
    [receivedData release], receivedData = nil;
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

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [[UIApplication sharedApplication] bkd_popNetworkActivity];
    
    NSString *text = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
    DLog(@"Succeeded! Received ProtoBuf %@", text);
    self.textView.text = text;
    [text release];
    
    self.person = [[[Person builder ] mergeFromData:receivedData] build];
    DLog(@"Succeeded! Created person based on ProtoBuf %@", person);
    
    // release the connection, and the data object
    [connection release];
}

- (IBAction)execute:(id)sender {
    self.textView.text = @"";
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", [[BKDEnvironment sharedInstance] baseURL], @"protobuf/person"]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/x-protobuf" forHTTPHeaderField:@"Accept"];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [request release];
    
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        self.receivedData = [NSMutableData data];
    } else {
        // Inform the user that the connection failed.
    }
    [[UIApplication sharedApplication] bkd_pushNetworkActivity];
}
@end