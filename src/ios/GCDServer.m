/********* GCDServer.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "GCDWebServer.h"

@interface GCDServer : CDVPlugin
@property (nonatomic, strong) GCDWebServer* webServer;
@property int port;
- (void)startServer:(CDVInvokedUrlCommand*)command;

@end

@implementation GCDServer

- (void)startServer:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    if (_webServer == nil) {
        _webServer = [[GCDWebServer alloc] init];
        
        NSDictionary* dict = [command.arguments objectAtIndex:0];
        NSString * folder = @"www";
        if (dict[@"folder"] != nil) {
            folder = dict[@"folder"];
        }
        _port = 8080;
        if (dict[@"port"] != nil) {
            _port = [dict[@"port"] intValue];
        }
        NSBundle* mainBundle;
        // Get the main bundle for the app.
        mainBundle = [NSBundle mainBundle];
        NSString *path = [mainBundle pathForResource:folder ofType:nil];
        [_webServer addGETHandlerForBasePath:@"/" directoryPath:path indexFilename:nil cacheAge:3600 allowRangeRequests:YES];
        [_webServer startWithPort:_port bonjourName:nil];
        NSLog(@"path: %@",path);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"okay"];
    }else{
        bool running = [_webServer isRunning];
        if (running == false) {
            [_webServer startWithPort:_port bonjourName:nil];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"restarted"];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"already running"];
        }
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stopServer:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    if (_webServer != nil) {
        [_webServer stop];
        _webServer = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"okay"];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"not running"];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
