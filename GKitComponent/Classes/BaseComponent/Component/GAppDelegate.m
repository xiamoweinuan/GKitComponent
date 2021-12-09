//
//  GAppDelegate.m
//  GKitComponent
//
//  Created by gaoshuangone@qq.com on 12/07/2021.
//  Copyright (c) 2021 gaoshuangone@qq.com. All rights reserved.
//

#import "GAppDelegate.h"
#import "GBaseNavViewController.h"
#import "GTabBarController.h"
#import "NSObject+swizzle.h"
#import "GBaseViewController.h"
#import "GRouter.h"

//线上环境打开使用
#if __has_include("AvoidCrash.h") && !DEBUG
#import "AvoidCrash.h"
#endif

//测试环境打开使用
#if  __has_include("LLDebugTool.h") && DEBUG
#import "LLDebugTool.h"
#endif

//线上环境打开配置
#if __has_include(<Bugly.h>)
#import <Bugly.h>
#endif
#if __has_include("Bugly.h")
#import "Bugly.h"
#endif


#if __has_include(<SVProgressHUD.h>)
#import <SVProgressHUD.h>
#endif
#if __has_include("SVProgressHUD.h")
#import "SVProgressHUD.h"
#endif
@implementation GAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    return YES;
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
-(void)installRootViewController{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupTabBarRootViewController:0  WithBlock:nil];
    [self.window makeKeyAndVisible];
}

-(void)setupTabBarRootViewController:(NSInteger)index WithBlock:(void (^)(void))block{
    
    
    if ([UIApplication sharedApplication].delegate.window) {//可能释放不了，可以loginvc当作window或者子vc
        
        [[UIApplication sharedApplication].delegate.window.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [UIApplication sharedApplication].delegate.window.rootViewController =nil;
    }
    GTabBarController* tab = nil;
    if ([self respondsToSelector:@selector(getTabRootViewController)]) {
        tab = [self getTabRootViewController];
    }else{
        tab =  [[GTabBarController alloc]initWithTabBarControlerWithChildVCArray:@[[[GRouter shard] findModWithName:@"GBaseViewController"],[[GRouter shard] findModWithName:@"GBaseViewController"],[[GRouter shard] findModWithName:@"GBaseViewController"],[[GRouter shard] findModWithName:@"GBaseViewController"]]
                                                                         titleArray:@[@"1",@"2",@"3",@"4"]
                                                                         imageArray:@[]
                                                                 selectedImageArray:@[]
                                                                  withAnimateImages:@[]];

        // 设置一个自定义 View,大小等于 tabBar 的大小
        UIView *bgView = [[UIView alloc] initWithFrame:tab.tabBar.bounds];
        // 给自定义 View 设置颜色
        bgView.backgroundColor = [UIColor lightGrayColor];
        // 将自定义 View 添加到 tabBar 上
        [tab.drTabBar insertSubview:bgView atIndex:0];
        if (index !=0) {
            tab.selectedIndex = index;
        }
    }
   
    [UIView transitionWithView:[UIApplication sharedApplication].delegate.window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].delegate.window.rootViewController = tab;
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        
    }];
    
}
-(void)installConfig{
#if __has_include("AvoidCrash.h") && !DEBUG
    //全局启动防止崩溃功能
    [AvoidCrash makeAllEffective];
    //配置方法异常异常集合
    NSArray *noneSelClassStrings = @[
        @"NSNull",
        @"NSNumber",
        @"NSString",
        @"NSDictionary",
        @"NSArray"
    ];
    [AvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];
    //防止某个前缀的类的方法异常
    NSArray *noneSelClassPrefix = @[
        @"AvoidCrash"
    ];
    [AvoidCrash setupNoneSelClassStringPrefixsArr:noneSelClassPrefix];
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
#endif
    
    
    
#if __has_include(<SVProgressHUD.h>) || __has_include("SVProgressHUD.h")
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setBackgroundLayerColor:[[UIColor blackColor] colorWithAlphaComponent:0.03f]];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setFont:kFontMedium(14)];
    
#endif
    
    
#if  __has_include("LLDebugTool.h")
    [[LLDebugTool sharedTool] startWorkingWithConfigBlock:^(LLConfig * _Nonnull config) {
        
        config.colorStyle = LLConfigColorStyleSimple;
        [config configPrimaryColor:[UIColor orangeColor] backgroundColor:[UIColor whiteColor] statusBarStyle:UIStatusBarStyleDefault];
        config.hideWhenInstall = YES;
        config.showDebugToolLog = NO;
        config.inactiveAlpha =.5f;
        config.shakeToHide = YES;
    }];
#endif
    
}

#if __has_include("AvoidCrash.h")
// 异常错误处理
+ (void)dealwithCrashMessage:(NSNotification *)note {
    //注意:所有的信息都在userInfo中
    NSLog(@"******************* 空指针异常 %@", note.userInfo);
    NSAssert(0, @"");
    NSDictionary *dict = note.userInfo;
    if(dict) {
#if __has_include(<Bugly.h>) || __has_include("Bugly.h")
        NSString *name = [NSString stringWithFormat:@"空指针异常:%@", dict[@"errorPlace"]];
        NSString *reason = dict[@"errorReason"];
        NSException *ex = [[NSException alloc] initWithName:name reason:reason userInfo:dict];
        [Bugly reportException:ex];
#endif
        
    }
}
#endif
@end
