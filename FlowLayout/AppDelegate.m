//
//  AppDelegate.m
//  FlowLayout
//
//  Created by 树下 on 2020/5/9.
//  Copyright © 2020 MY. All rights reserved.
//

#import "AppDelegate.h"
#import "FlowViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[FlowViewController alloc]init];
    [self.window makeKeyAndVisible];

    return YES;
}


-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    NSString *text = [[url host] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"URL scheme:%@", [url scheme]);
    //参数
    NSLog(@"URL host:%@", [url host]);

    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"iOS9打开啦" message:text preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction*action) {
    }]];
    [self.window.rootViewController presentViewController:alertVC animated:YES completion:nil];
    return YES;
}




@end
