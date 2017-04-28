//
//  RedBookToViewController.m
//  openBook
//
//  Created by Alpha on 2017/4/27.
//  Copyright © 2017年 STT. All rights reserved.
//

#import "RedBookToViewController.h"



@interface RedBookToViewController ()

@end

@implementation RedBookToViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIImageView * image = [[UIImageView alloc] init];
    [self.view addSubview:image];
    image.frame = CGRectMake(0, 100, size.width, size.height * 0.5);
    image.image = [UIImage imageNamed:@"plachtor"];
    
    _topView = (UIView *)image;
    
}


@end
