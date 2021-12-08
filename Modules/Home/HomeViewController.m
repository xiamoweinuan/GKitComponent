//
//  HomeViewController.m
//  GKitComponent
//
//  Created by gaoshuang on 2021/12/7.
//

#import "HomeViewController.h"
#import "Gheader.h"
#import "GRouter.h"
#import "LoginViewCtrlService.h"
@interface HomeViewController ()
@property (strong, nonatomic)UIButton* button;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"home";
    WEAKSELF
    _button = [UIButton g_Init:^(UIButton * _Nonnull gs) {
        gs.g_chain.backgroundColor(kRedColor);
    } withSuperView:self.view withMasonry:^(MASConstraintMaker * _Nonnull make, UIButton * _Nonnull gs) {
        
    } withAction:^(UIButton * _Nonnull gs) {
//        [kGetCurrentVC pushCanvas:@"LoginViewCtrl"];
//        id<GModProtocol> vc=  [[CCRouter shard]findModWithName:@"LoginViewCtrl"];
        
//        LoginViewCtrlServiceImp* service =  [[CCRouter instance] findServiceWithName:@"LoginViewCtrl"];
        
        
//        [kGetCurrentVC pushCanvas:@"LoginViewCtrl"];
//        [self.navigationController pushViewController:(UIViewController*)vc animated:YES];
        [[GRouter shard] pushCanvas:@"LoginViewCtrl"];
    }];
    // Do any additional setup after loading the view.
}
-(void)changeButtonColor{
    _button.g_chain.backgroundColor(kOrangeColor);
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
