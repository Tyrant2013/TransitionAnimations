//
//  SlideAnimationController.m
//  TransitionAnimations
//
//  Created by 庄晓伟 on 16/3/28.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "SlideAnimationController.h"

@implementation SlideAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *container = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    [container addSubview:toView];
    CGAffineTransform fromTransform = CGAffineTransformTranslate(CGAffineTransformIdentity, -CGRectGetWidth(fromView.bounds), 0);
    CGAffineTransform toTransfrom = CGAffineTransformIdentity;
    toView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, CGRectGetWidth(fromView.bounds), 0);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = fromTransform;
        toView.transform = toTransfrom;
    } completion:^(BOOL finished) {
        BOOL isCancel = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!isCancel];
    }];
}

@end
