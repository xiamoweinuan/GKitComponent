//
//  GAppDelegate.h
//  GKitComponent
//
//  Created by gaoshuangone@qq.com on 12/07/2021.
//  Copyright (c) 2021 gaoshuangone@qq.com. All rights reserved.
//

@import UIKit;
@protocol AppDelegateProtocol <NSObject>
@optional
/**初始化一个空的tabba*/
-(void)installRootViewController;
/**返回自定义的tabbar*/
-(id)getTabRootViewController;
/**配置项*/
-(void)installConfig;
/**切换tabbar的selectedIndex*/
-(void)setupTabBarRootViewController:(NSInteger)index WithBlock:(void (^)(void))block;

@end
/**UIApplicationMain中直接加载使用或者
 子类中调用  [super application:application didFinishLaunchingWithOptions:launchOptions];
 */
@interface GAppDelegate : UIResponder <UIApplicationDelegate,AppDelegateProtocol>

@property (strong, nonatomic) UIWindow *window;

@end


