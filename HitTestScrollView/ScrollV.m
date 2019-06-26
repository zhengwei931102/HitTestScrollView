//
//  ScrollV.m
//  UIScrollView
//
//  Created by zw on 2019/6/25.
//  Copyright © 2019 stu074. All rights reserved.
//

#import "ScrollV.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@implementation ScrollV
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //添加ScrollView
        [self addScrollView];
    }
    return self;
}
#pragma mark---添加ScrollView
-(void)addScrollView
{
    _myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(40, 0, WIDTH-80, self.bounds.size.height)];
    _myScrollView.pagingEnabled=YES;
    _myScrollView.clipsToBounds=NO;
    _myScrollView.bounces=NO;
    _myScrollView.showsHorizontalScrollIndicator=NO;
    _myScrollView.contentSize=CGSizeMake((WIDTH-80)*5, self.bounds.size.height);
    [self addSubview:_myScrollView];
    
    for (int i=0; i<5; i++) {
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(i*(WIDTH-80), 0, WIDTH-80, self.bounds.size.height)];
        v.tag = 1000+i;
        v.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0];
        [_myScrollView addSubview:v];
        if(i==0){
            UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(-40, 0, WIDTH-80+40, self.bounds.size.height)];
            [v addSubview:firstView];
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
            btn.backgroundColor = [UIColor orangeColor];
            [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
            [firstView addSubview:btn];
            
        }
    }
}
- (void)click{
    NSLog(@"EREFEFREWREWFEFEQWFEWFE");
}
#pragma mark---修改hitTest方法
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    
    for (UIView *subview in self.subviews) {
        if([subview isKindOfClass:[UIScrollView class]]){
           CGPoint newpoint = [subview convertPoint:point fromView:self];
            if(!CGRectContainsPoint(subview.bounds, newpoint)){
                for (UIView *subview2 in subview.subviews) {
                    if(subview2.tag-1000==0){
                        for (UIView *firstView in subview2.subviews) {
                            CGPoint newpoint2 = [firstView convertPoint:newpoint fromView:subview];
                            if(CGRectContainsPoint(firstView.bounds, newpoint2)){
                                return [firstView hitTest:newpoint2 withEvent:event];
                            }
                        }
                    }
                    
                    
                }
                return subview;
            }
        }
    }
    return view;
}
@end
