//
//  ST_openBookSegue.m
//  openBook
//
//  Created by Alpha on 2017/4/28.
//  Copyright © 2017年 STT. All rights reserved.
//

#import "ST_openBookSegue.h"

@implementation ST_openBookSegue

{
    ST_openBookAnimation *animator;
}

static ST_openBookSegue *sharedManager;


- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination {
    @synchronized(self) {
        if (!sharedManager) {
            sharedManager = [super initWithIdentifier:identifier source:source destination:destination];
        }
    }
    return sharedManager;
}


- (void)perform {
    UIViewController *destinationViewController = self.destinationViewController;
    UIViewController *sourceViewController      = self.sourceViewController;
    destinationViewController.transitioningDelegate  = self;
    destinationViewController.modalPresentationStyle = UIModalPresentationCustom;
    [sourceViewController presentViewController:destinationViewController animated:YES completion:nil];
}

- (void)setupBookView:(UIImage *)bookImage frame:(CGRect)frame {
    animator          = [ST_openBookAnimation new];
    animator.delegate = self;
    animator.bookView = [[ST_BookView alloc] initWithFrame:frame];
    [animator.bookView setupBookCoverImage:bookImage];
}

- (void)setDurationTime:(NSTimeInterval)duration {
    animator.transitionDuration = duration;
}

- (void)setCompletionBlock:(ST_openBookSegueCompletionBlock)openCompletion closeCompletion:(ST_openBookSegueCompletionBlock)closeCompletion {
    animator.openCompletion  = [openCompletion copy];
    animator.closeCompletion = [closeCompletion copy];
}

- (void)closeCompletion {
    animator      = nil;
    sharedManager = nil;
}

#pragma mark - UIViewControllerTransitioningDelegate Methods


- (id <UIViewControllerAnimatedTransitioning> )animationControllerForPresentedController:(UIViewController *)presented
                                                                    presentingController:(UIViewController *)presenting
                                                                        sourceController:(UIViewController *)source {
    animator.presenting = YES;
    return animator;
}


- (id <UIViewControllerAnimatedTransitioning> )animationControllerForDismissedController:(UIViewController *)dismissed {
    animator.presenting = NO;
    return animator;
}


@end
