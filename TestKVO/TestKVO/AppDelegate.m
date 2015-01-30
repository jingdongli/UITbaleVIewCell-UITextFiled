//
//  AppDelegate.m
//  TestKVO
//
//  Created by gfan on 15/1/29.
//  Copyright (c) 2015年 gfan. All rights reserved.
//

#import "AppDelegate.h"
#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "Person.h"
#import "Tweet.h"

#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSString *pathToFile = [[NSBundle bundleForClass: [self class]] pathForResource:@"plist" ofType:@"plist"];
    NSDictionary  *plist = [NSDictionary dictionaryWithContentsOfFile:pathToFile];
    
    
        NSString *caminhoJson = [[NSBundle bundleForClass: [self class]] pathForResource:@"tweet" ofType:@"json"];
    
        NSData *data = [NSData dataWithContentsOfFile:caminhoJson];
    
       NSDictionary *jsonParsed = [NSJSONSerialization JSONObjectWithData:data
                                               options:NSJSONReadingMutableContainers error:nil];
    
    
    DCKeyValueObjectMapping *parser1 = [DCKeyValueObjectMapping mapperForClass: [Tweet class]];
    
    Tweet *tweet = [parser1 parseDictionary:jsonParsed];
    NSLog(@"%@ - %@", tweet.idStr, tweet.text);
    
    
    DCParserConfiguration *configuration = [DCParserConfiguration configuration];
    configuration.datePattern = @"yyyy-MM-dd'T'hh:mm:ssZ";
    DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[Person class] andConfiguration:configuration];
    Person *person = [parser parseDictionary:plist];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
    ViewController *tmpVC  = [[ViewController alloc] init];
    UINavigationController *tmpNav = [[UINavigationController alloc] initWithRootViewController:tmpVC];
    self.window.rootViewController = tmpNav;
    
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
