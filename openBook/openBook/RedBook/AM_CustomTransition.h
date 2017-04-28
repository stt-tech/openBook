//
//  AM_CustomTransition.h
//  AsessManager
//
//  Created by Alpha on 15/03/2017.
//  Copyright © 2017 STT. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef enum {
    
    push,
    pop,
}TransitionType;


@interface AM_CustomTransition : NSObject <UIViewControllerAnimatedTransitioning>


-(instancetype)initWithTransitionType:(TransitionType) type;


@end
