//
//  BBGamePad.m
//  BombBoy
//
//  Created by guoyi on 16/3/22.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "BBGamePad.h"

@interface BBGamePad () {
    //  UI
    UIView *_backgroundView;
    UIView *_handShank;
    
    //  Data

}

@end

static float Width_HandShank = 30.0f;

@implementation BBGamePad

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _prepareBackgroundView];
        [self _prepareHandShank];
    }
    return self;
}

- (void)_prepareBackgroundView {
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.layer.masksToBounds = YES;
    _backgroundView.layer.cornerRadius = CGRectGetWidth(self.bounds)/2.0f;
    _backgroundView.backgroundColor = [UIColor blueColor];
    [self addSubview:_backgroundView];
}

- (void)_prepareHandShank {
    _handShank = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.bounds) - Width_HandShank) / 2.0f,
                                                          (CGRectGetHeight(self.bounds) - Width_HandShank) / 2.0f,
                                                          Width_HandShank, Width_HandShank)];
    _handShank.backgroundColor = [UIColor redColor];
    _handShank.layer.masksToBounds = YES;
    _handShank.layer.cornerRadius = Width_HandShank / 2.0f;
    [self addSubview:_handShank];
}

#pragma mark - Touch - Delegate

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [touches.anyObject locationInView:self];
    if (point.x < 0) {
        point.x = 0;
    } else if (point.x > CGRectGetWidth(self.bounds)) {
        point.x = CGRectGetWidth(self.bounds);
    }
    
    if (point.y < 0) {
        point.y = 0;
    } else if (point.y > CGRectGetWidth(self.bounds)) {
        point.y = CGRectGetWidth(self.bounds);
    }
    
    _handShank.frame = CGRectMake(point.x - Width_HandShank / 2.0f,
                                  point.y - Width_HandShank / 2.0f,
                                  Width_HandShank, Width_HandShank);
    
    //  计算方向
    if (_delegate &&
        [_delegate respondsToSelector:@selector(gamePad:didMoveHandShankWithDirection:)]) {
        float originX = point.x - CGRectGetWidth(self.bounds) / 2.0f;
        float originY = point.y - CGRectGetWidth(self.bounds) / 2.0f;
        
        NSLog(@"point = %.1f %.1f",originX,originY);
        BBGamePadDirection direcation;
        if (fabsf(originX) > fabsf(originY)) {
            //  左 或 右
            if (originX > 0) {
                direcation = BBGamePadDirection_Right;
            } else {
                direcation = BBGamePadDirection_Left;
            }
        } else {
            //  上 或 下
            if (originY > 0) {
                direcation = BBGamePadDirection_Top;
            } else {
                direcation = BBGamePadDirection_Bottom;
            }
        }

        [_delegate gamePad:self didMoveHandShankWithDirection:direcation];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [UIView animateWithDuration:0.25 animations:^{
        _handShank.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.0f, CGRectGetHeight(self.bounds) / 2.0f);
    }];
}

@end
