//
//  ST_openBookAnimation.h
//  openBook
//
//  Created by Alpha on 2017/4/28.
//  Copyright © 2017年 STT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ST_BookView.h"

typedef void(^ST_openBookSegueCompletionBlock)(BOOL transitionCompletion);


@protocol ST_openBookAnimationDelegate <NSObject>

-(void)closeCompletion;


@end



@interface ST_openBookAnimation : NSObject


@property (nonatomic, weak) id <ST_openBookAnimationDelegate>delegate;


@property (nonatomic, assign, getter = isPresenting) BOOL   presenting;

@property (strong, nonatomic) ST_BookView   *bookView;

@property (nonatomic) NSTimeInterval   transitionDuration;

@property (nonatomic, strong) ST_openBookSegueCompletionBlock openCompletion;

@property (nonatomic, strong) ST_openBookSegueCompletionBlock closeCompletion;

@end
