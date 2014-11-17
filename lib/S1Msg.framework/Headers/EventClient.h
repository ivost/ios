#import <Foundation/Foundation.h>

#import "ZMQContext.h"
#import "ZMQSocket.h"
#import "ZMQException.h"

@interface EventClient : NSObject {
    ZMQContext *context;
    ZMQSocket *sock;
}

- (id) initWithEndpoint:(NSString *)endpoint;

- (void) sendEventWithId: (int) eventId data: (NSData *) messageData ;


@end