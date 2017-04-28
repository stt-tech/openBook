//
//  ST_BookView.h
//  openBook
//
//  Created by Alpha on 2017/4/28.
//  Copyright © 2017年 STT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ST_BookView : UIView


@property (nonatomic) UIView *cover;
@property (nonatomic) UIView *content;

- (void)setupBookCoverImage:(UIImage *)image;

@end
