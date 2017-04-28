//
//  ST_openBookSegue.h
//  openBook
//
//  Created by Alpha on 2017/4/28.
//  Copyright © 2017年 STT. All rights reserved.
//


#import "ST_openBookAnimation.h"

@interface ST_openBookSegue : UIStoryboardSegue <UIViewControllerTransitioningDelegate,ST_openBookAnimationDelegate>

- (void)setupBookView:(UIImage *)bookImage frame:(CGRect)frame;
- (void)setDurationTime:(NSTimeInterval)duration;
- (void)setCompletionBlock:(ST_openBookSegueCompletionBlock)openCompletion closeCompletion:(ST_openBookSegueCompletionBlock)closeCompletion;


@end
