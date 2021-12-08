//
//  DRTabBarController.h
//  DRLive
//
//  Created by tg on 2020/9/10.
//  Copyright © 2020 DRLive. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTabBarController : UITabBarController

- (instancetype)initWithTabBarControlerWithChildVCArray:(NSArray <UIViewController *>*)childVCArray titleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *>*)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray withAnimateImages:(NSArray <NSArray *>*)animateArray;

@end

NS_ASSUME_NONNULL_END
