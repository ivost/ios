#import "EventClient.h"

@implementation EventClient

//- (id)init {
//    self = [super init];
//    if (self) [self release];
//    return this;
//}

- (id)initWithEndpoint:(NSString *)endpoint {
    NSLog(@"initWithEndpoint %@", endpoint);
    self = [super init];
    if (!self) return nil;
    context = [[ZMQContext alloc] initWithIOThreads:1U];
    sock = [context socketWithType:ZMQ_PUB];
    if(![sock connectToEndpoint: endpoint]) {
        NSLog(@"Connect error");
        return nil;
    }
    // zmq needs small delay to avoid message loss during connection
    sleep(1);
    return self;
}

- (void)dealloc {
    [sock close];
    [context terminate];
    [super dealloc];
}


- (void) sendEventWithId: (int) eventId data: (NSData *) messageData {
    NSLog(@"sendEvent %d", eventId);
    // send event id as hex string
    char evtid[10];
    sprintf(evtid, "%08x", eventId);
    
    NSData *devtid = [NSData dataWithBytes:evtid length:strlen(evtid)];
    [sock sendData: devtid withFlags: ZMQ_SNDMORE];
    //NSLog(@"Send %@", devtid);
    
    // sender
    char sender[] = "iOS";
    NSData *dsender = [NSData dataWithBytes:sender length:strlen(sender)];
    [sock sendData: dsender withFlags: ZMQ_SNDMORE];
    //NSLog(@"Send %@", dsender);

    // payload
    [sock sendData: messageData withFlags: 0];
    //NSLog(@"Send %@", msg);
    
}

@end
