//
//  OpenBookFromViewController.m
//  openBook
//
//  Created by Alpha on 2017/4/28.
//  Copyright © 2017年 STT. All rights reserved.
//

#import "OpenBookFromViewController.h"
#import "ST_openBookSegue.h"


@interface OpenBookFromViewController ()

@property (weak, nonatomic) IBOutlet UIButton *imageButton;


@end

@implementation OpenBookFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"翻书效果";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}
/**
 *  <#Description#>
 *
 *  @param segue  <#segue description#>
 *  @param sender <#sender description#>
 */
-(void)prepareForSegue:(ST_openBookSegue *)segue sender:(id)sender
{
    CGRect frame = self.imageButton.frame;
    [segue setupBookView:self.imageButton.currentImage frame:frame];
    [segue setCompletionBlock:^(BOOL transitionCompleted) {
        NSLog(@"open!");
    } closeCompletion:^(BOOL transitionCompleted) {
        NSLog(@"close!");
    }];
    [super prepareForSegue:segue sender:sender];
}





@end
