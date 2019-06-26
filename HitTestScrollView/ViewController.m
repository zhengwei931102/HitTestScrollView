//
//  ViewController.m
//  HitTestScrollView
//
//  Created by zw on 2019/6/26.
//  Copyright © 2019 zw. All rights reserved.
//

#import "ViewController.h"
#import "ScrollV.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ScrollV *usv=[[ScrollV alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [self.view addSubview:usv];
}


@end
