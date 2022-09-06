/********* CDVGCDWebServer.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "GCDWebServer.h"

@interface CDVGCDWebServer : CDVPlugin {
  // Member variables go here.
}

- (void)startServer:(CDVInvokedUrlCommand*)command;
@end

@implementation CDVGCDWebServer

- (void)startServer:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"okay"];


    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
