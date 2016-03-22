//
//  BBGameBackgroundView.m
//  BombBoy
//
//  Created by guoyi on 16/3/22.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "BBGameBackgroundView.h"

@implementation BBGameBackgroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(Screen_Width, Screen_Height, 300, 300)];
    [[UIColor redColor] setFill];
    [path fill];
}

@end
