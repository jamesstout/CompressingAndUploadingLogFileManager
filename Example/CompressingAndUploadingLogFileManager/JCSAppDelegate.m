//
//  JCSAppDelegate.m
//  CompressingAndUploadingLogFileManager
//
//  Created by jamesstout on 04/24/2020.
//  Copyright (c) 2020 jamesstout. All rights reserved.
//

#import "JCSAppDelegate.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <CompressingAndUploadingLogFileManager/CompressingAndUploadingLogFileManager.h>

const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface JCSAppDelegate ()

@property (strong, nonatomic) DDFileLogger *fileLogger;
@property (strong, nonatomic) CompressingAndUploadingLogFileManager *logFileManager;

@end

@implementation JCSAppDelegate

@synthesize fileLogger, logFileManager;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.hkwarnings.com/observatoryWarnings/logFile.php"]];
    [request setHTTPMethod:@"POST"];
    
    logFileManager = [[CompressingAndUploadingLogFileManager alloc] initWithUploadRequest:request];
    
    fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
    
    fileLogger.maximumFileSize  = 1024 * 100;  // 1 KB
    fileLogger.rollingFrequency =   60 * 1;  // 1 Minute
    
    fileLogger.logFileManager.maximumNumberOfLogFiles = 4;
    
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    [DDLog addLogger:fileLogger];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(writeLogMessages:)
                                   userInfo:nil
                                    repeats:YES];
    
    
    return YES;
}

- (void)writeLogMessages:(NSTimer *)aTimer
{
    DDLogVerbose(@"I like cheese");
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler
{
    DDLogVerbose(@"BackgroundUploadLogFileManager: handleEventsForBackgroundURLSession Appdel");
    
    if ([[self.logFileManager sessionIdentifier] isEqualToString:identifier]) {
        [self.logFileManager handleEventsForBackgroundURLSession:completionHandler];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
