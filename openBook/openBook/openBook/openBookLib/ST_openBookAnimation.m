//
//  ST_openBookAnimation.m
//  openBook
//
//  Created by Alpha on 2017/4/28.
//  Copyright © 2017年 STT. All rights reserved.
//

#import "ST_openBookAnimation.h"

@implementation ST_openBookAnimation

{
    CGPoint bookViewOrignCenter;
}

#pragma mark -- UIViewControllerAnimatedTransitioning method --

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning> )transitionContext {
    NSTimeInterval duration = self.transitionDuration ? self.transitionDuration : 1.0f;
    return duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning> )transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [transitionContext.containerView addSubview:self.bookView];
    if (self.presenting) {
        [self openBookView:transitionContext fromViewController:fromViewController toViewController:toViewController];
        return;
    }
    [self closeBookView:transitionContext fromViewController:fromViewController toViewController:toViewController];
}

- (void)animationEnded:(BOOL)transitionCompleted {
    if (self.presenting) {
        if (self.openCompletion) {
            self.openCompletion(transitionCompleted);
            self.openCompletion = nil;
        }
        return;
    }
    if (self.closeCompletion) {
        self.closeCompletion(transitionCompleted);
        self.closeCompletion = nil;
    }
    [self.delegate closeCompletion];
}

#pragma mark -- private method --


- (void)prepareOpenBookAnimation:(CGFloat)scaleX scaleY:(CGFloat)scaleY {
    [self.bookView insertSubview:self.bookView.content aboveSubview:self.bookView.cover];
    self.bookView.content.transform       = CGAffineTransformMakeScale(1 / scaleX, 1 / scaleY);
    self.bookView.content.frame           = CGRectMake(0, 0, CGRectGetWidth(self.bookView.frame), CGRectGetHeight(self.bookView.frame));
    self.bookView.cover.layer.anchorPoint = CGPointMake(0, 0.5);
    self.bookView.cover.center            = CGPointMake(0.0, self.bookView.cover.bounds.size.height / 2.0); // compensate for anchor offset
    self.bookView.cover.opaque            = YES;
}

- (void)openBookView:(id <UIViewControllerContextTransitioning> )transitionContext fromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    fromViewController.view.userInteractionEnabled = NO;
    CGFloat scaleX = fromViewController.view.bounds.size.width / self.bookView.bounds.size.width;
    CGFloat scaleY = fromViewController.view.bounds.size.height / self.bookView.bounds.size.height;
    self.bookView.content = toViewController.view;
    [self prepareOpenBookAnimation:scaleX scaleY:scaleY];
    // 開く前の中心点を記録しておく
    bookViewOrignCenter = self.bookView.center;
    CATransform3D transformblank = CATransform3DMakeRotation(-M_PI_2 / 1.01, 0.0, 1.0, 0.0);
    transformblank.m34 = 1.0f / 250.0f;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionShowHideTransitionViews animations:^{
        self.bookView.transform = CGAffineTransformMakeScale(scaleX, scaleY);
        self.bookView.center = fromViewController.view.center;
        self.bookView.cover.layer.transform = transformblank;
        [self.bookView bringSubviewToFront:self.bookView.cover];
    } completion:^(BOOL finished) {
        if (finished) {
            self.bookView.cover.layer.hidden = YES;
            [transitionContext completeTransition:YES];
        }
    } ];
}


- (void)closeBookView:(id <UIViewControllerContextTransitioning> )transitionContext fromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    toViewController.view.userInteractionEnabled = YES;
    self.bookView.cover.layer.hidden             = NO;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionShowHideTransitionViews animations:^{
        self.bookView.center = bookViewOrignCenter;
        self.bookView.transform = CGAffineTransformIdentity;
        self.bookView.cover.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.bookView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }
    } ];
}



@end
