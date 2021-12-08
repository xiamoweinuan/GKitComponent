//
//  LoginViewCtrl.m
//  GKitComponent
//
//  Created by gaoshuang on 2021/12/7.
//

#import "LoginViewCtrl.h"
#import "GHeader.h"
#import "GRouter.h"
#import "HomeViewControllerService.h"
@interface LoginViewCtrl ()

@end

@implementation LoginViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Login";

    WEAKSELF
    UIButton* button = [UIButton g_Init:^(UIButton * _Nonnull gs) {
        gs.g_chain.backgroundColor(kRedColor);
    } withSuperView:self.view withMasonry:^(MASConstraintMaker * _Nonnull make, UIButton * _Nonnull gs) {
        make.left.top.offset(100);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    } withAction:^(UIButton * _Nonnull gs) {
//        [kGetCurrentVC popCanvas];
        
//        HomeViewControllerService* service =   [[CCRouter instance]findServiceWithName:@"HomeViewController"];
 
//        HomeViewController
//        [service changeButtonColor];
        
//        [kGetCurrentVC popCanvas];
        
        
//        id vc =   [[CCRouter shard]findModWithName:@"HomeViewController"];
//        [vc changeButtonColor];

        
        [[GRouter shard] popToCanvas:@"HomeViewController" withComplete:^(id vc) {
            [vc changeButtonColor];
        }];
        
    }];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
