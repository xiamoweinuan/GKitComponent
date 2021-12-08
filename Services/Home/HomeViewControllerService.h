//
//  HomeViewControllerService.h
//  GKitComponent
//
//  Created by gaoshuang on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import "GServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@protocol HomeViewControllerProtocol <GServiceProtocol>
-(void)changeButtonColor;
@end
@interface HomeViewControllerService : NSObject<HomeViewControllerProtocol>

@end

NS_ASSUME_NONNULL_END
