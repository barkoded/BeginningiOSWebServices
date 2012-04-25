#import "BKDJSONViewController.h"
#import "BKDEnvironment.h"
#import "UIApplication+BKDNetworkActivity.h"

#import "AFJSONRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface BKDJSONViewController ()
@property (nonatomic, retain) NSMutableData *receivedData;
@end

@implementation BKDJSONViewController

@synthesize receivedData;
@synthesize person;
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"JSON", @"JSON");
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
    [self setTextView:nil];
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
    
    NSError *error;
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:&error];
    
    DLog(@"Succeeded! Received JSON %@", JSON);

    self.textView.text = [NSString stringWithFormat:@"%@", JSON];
    self.person = [[BKDPerson alloc] initWithAttributes:JSON];
    DLog(@"Succeeded! Created person based on JSON %@", person);
    
    // release the connection, and the data object
    [connection release];
}

- (IBAction)execute:(id)sender {
    self.textView.text = @"";
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/%@", [[BKDEnvironment sharedInstance] baseURL], @"rest/person"]];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
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

/*
    //
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];    
    //
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {

        [[UIApplication sharedApplication] bkd_popNetworkActivity];
        DLog(@"Succeeded! Received JSON %@", response);
        self.textView.text = @"";
        
        self.person = [[BKDPerson alloc] initWithAttributes:JSON];
        DLog(@"Succeeded! Created person based on JSON %@", person);
    } failure:nil];
    [operation start];
*/    
}
@end
