//
//  ST_BookView.m
//  openBook
//
//  Created by Alpha on 2017/4/28.
//  Copyright © 2017年 STT. All rights reserved.
//

#import "ST_BookView.h"

@implementation ST_BookView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _cover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [self addSubview:_cover];
    }
    return self;
}

- (void)setupBookCoverImage:(UIImage *)image {
    _cover.layer.contents = (__bridge id) (image.CGImage);
}


@end
