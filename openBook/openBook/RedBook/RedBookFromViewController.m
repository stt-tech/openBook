//
//  RedBookFromViewController.m
//  openBook
//
//  Created by Alpha on 2017/4/27.
//  Copyright © 2017年 STT. All rights reserved.
//

#import "RedBookFromViewController.h"

#import "RedBookToViewController.h"
#import "AM_CustomTransition.h"
@interface RedBookFromViewController () <UINavigationControllerDelegate>


@end

@implementation RedBookFromViewController

- (IBAction)buttonAction:(id)sender {
    NSLog(@"====");
    RedBookToViewController * toVC = [[RedBookToViewController alloc] init];
    [self.navigationController pushViewController:toVC animated:YES];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(navigationBarBack)];
    
    // 这个地方因为要用到push 和pop的方法 所以需要设置navigationController的代理方法 这个是必须设置的
    self.navigationController.delegate = self;
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    /*
     注意 这个效果会直接打乱viewcontroller中栈容器里的动画效果  
     本代码 因为要集合了多种效果 所以 这个地方从viewcontroller 直接model一个uinagivationcontroller  在使用小红书效果的时候一般建议是 fromViewController 是跟试图（一级页面） toViewController为（二级页面） 之后最好不要在有三级页面
     */
    return  [[AM_CustomTransition alloc] initWithTransitionType:operation== UINavigationControllerOperationPush?push:pop];
}

-(void)navigationBarBack
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
