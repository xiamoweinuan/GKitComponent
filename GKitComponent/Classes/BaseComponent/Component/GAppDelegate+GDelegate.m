//
//  GAppDelegate+GLanguage.m
//  GKitComponent
//
//  Created by gaoshuang on 2021/12/7.
//

#import "GAppDelegate+GDelegate.h"
#import "NSObject+swizzle.h"
#import "GBaseNavViewController.h"
#import "GBaseViewController.h"
#import "GTabBarController.h"
#import "GRouter.h"

@implementation GAppDelegate (GDelegate)

- (BOOL)applicationExchangeMethod:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self applicationExchangeMethod:application didFinishLaunchingWithOptions:launchOptions];
    
    
    if ([self respondsToSelector:@selector(getRootViewController)]) {
  
        self.window.rootViewController = [self getRootViewController];
    }else{
        GTabBarController* tab =[[GTabBarController alloc]initWithTabBarControlerWithChildVCArray:@[[[GRouter shard] findModWithName:@"HomeViewController"],[[GRouter shard] findModWithName:@"HomeViewController"],[[GRouter shard] findModWithName:@"HomeViewController"],[[GRouter shard] findModWithName:@"HomeViewController"]]
                                                                                       titleArray:@[@"1",@"2",@"3",@"4"]
                                                                                       imageArray:@[]
                                                                               selectedImageArray:@[]
                                                                                withAnimateImages:@[]];

        self.window.rootViewController = tab;
    }
    
    
    [self.window makeKeyAndVisible];

    return  YES;
}

+ (void)load {
    //SceneDelegate暂时用不到
#if __has_include("SceneDelegate.h")
    [[SceneDelegate class] swizzingMethod:@selector(scene:willConnectToSession:options:) withMethod:@selector(sceneExchangeMethod:willConnectToSession:options:)];
#endif



    [self swizzingMethod:@selector(application:didFinishLaunchingWithOptions:) withMethod:@selector(applicationExchangeMethod:didFinishLaunchingWithOptions:)];
}
@end
