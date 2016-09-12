//
//  ViewController.m
//  TransitionAnimations
//
//  Created by 庄晓伟 on 16/3/28.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "ViewController.h"
#import "SlideAnimationController.h"

@interface ViewController () <UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    NSLog(@"%@, %@", @(operation), fromVC);
    return [[SlideAnimationController alloc] init];
}

@end
