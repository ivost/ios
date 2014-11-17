#import <Foundation/Foundation.h>

#import "ZMQContext.h"
#import "ZMQSocket.h"
#import "ZMQException.h"

@interface EventClient : NSObject {
    ZMQContext *context;
    ZMQSocket *sock;
}

- (id) initWithEndpoint:(NSString *)endpoint;

//- (void)someMethodWithFirstValue:(SomeType)info1 secondValue:(AnotherType)info2;
- (void) sendEventWithId: (int) eventId data: (NSString *) messageData ;


@end