//
//  BBBaseView.m
//  BombBoy
//
//  Created by guoyi on 16/3/22.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "BBBaseView.h"

@implementation BBBaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        Screen_Width = [UIScreen mainScreen].bounds.size.width;
        Screen_Height = [UIScreen mainScreen].bounds.size.height;
    }
    return self;
}

@end
