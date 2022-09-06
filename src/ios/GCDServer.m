/********* GCDServer.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface GCDServer : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation GCDServer

- (void)startServer:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"okay"];


    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end
