//
//  AppDelegate.m
//  gameBattle
//
//  Created by Future on 2022/2/17.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 启动解析一次占领数据
//    [[GameDataManage shareManage]downloadBattleData];
    [[GameDataManage shareManage]parseGameBattleData];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController * vc = [[ViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    

    return YES;
}


@end
