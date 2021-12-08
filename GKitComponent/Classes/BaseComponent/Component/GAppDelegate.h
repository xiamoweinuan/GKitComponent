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
-(id)getRootViewController;

@end
@interface GAppDelegate : UIResponder <UIApplicationDelegate,AppDelegateProtocol>

@property (strong, nonatomic) UIWindow *window;

@end


