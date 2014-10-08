/**
 * How to do get/post 
 */
#import "ViewController.h"

@interface ViewController ()

// "private" methods

- (void) handleResponse: (NSData *) data;
- (void) handleError: (NSError *) error;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////
// Option 1 - using completion block

- (IBAction)txtFetchData2:(id)sender {
    NSString *queryString = [NSString stringWithFormat:@"http://chrisrisner.com/Labs/day7test.php?name=%@", [self.txtName text]];
    NSURLRequest *theRequest=[NSURLRequest
                              requestWithURL:[NSURL URLWithString:
                                              queryString]
                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                              timeoutInterval:60.0];
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            [self handleError: error];
        } else {
            [self handleResponse: data];
        }
    }];
}
////////////

// OPTION 2 - Posting using delegate


- (IBAction)btnFetchData1:(id)sender {
    NSMutableURLRequest * req=[NSMutableURLRequest
                requestWithURL:[NSURL URLWithString:
                            @"http://chrisrisner.com/Labs/day7test.php"]
                cachePolicy:NSURLRequestUseProtocolCachePolicy
                timeoutInterval:60.0];

//    NSString *queryString = [NSString stringWithFormat:@"http://chrisrisner.com/Labs/day7test.php?name=%@", [self.txtName text]];
//    NSURLRequest *theRequest=[NSURLRequest
//                              NSMutableURLRequest * req=[NSMutableURLRequest
//                                                         requestWithURL:[NSURL URLWithString: theRequest
//                                                                                 cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                                             timeoutInterval:60.0];
    
    // set POST method
    [req setHTTPMethod: @"POST"];

    // post plain text
//    NSString * post = [NSString stringWithFormat:@"postedValue=%@", [self.txtName text]];
//    NSData * data = [post dataUsingEncoding:NSASCIIStringEncoding];
    
    // post JSON
    NSError *error;
    NSDictionary* jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"Value1", @"Key1",
                                    @"Value2", @"Key2",
                                    nil];
    NSData* data = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    [req setHTTPBody: data];
    
    [req addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLConnection * con = [[NSURLConnection alloc] initWithRequest: req delegate:self];
    if (con) {
        _receivedData=[NSMutableData data];
    } else {
        //something bad happened
    }
}


#pragma NSUrlConnectionDelegate Methods

-(void)connection:(NSConnection*)conn didReceiveResponse:(NSURLResponse *)response
{
    if (_receivedData == NULL) {
        _receivedData = [[NSMutableData alloc] init];
    }
    [_receivedData setLength:0];
    //NSLog(@"didReceiveResponse: responseData length:(%lu)", (unsigned long)_receivedData.length);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_receivedData appendData:data];
}


- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self handleResponse:_receivedData];
}
//////////////

- (void) handleResponse: (NSData *) data {
    NSString *responseText = [[NSString alloc] initWithData:data encoding: NSASCIIStringEncoding];
    NSLog(@"Response: %@", responseText);
    
    NSString *newLineStr = @"\n";
    responseText = [responseText stringByReplacingOccurrencesOfString:@"<br />" withString:newLineStr];
    [self.lblData setText:responseText];
}

- (void) handleError: (NSError *) error {
    NSLog(@"Error: %@", error);
}

@end




