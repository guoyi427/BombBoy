//
//  BBGamePad.h
//  BombBoy
//
//  Created by guoyi on 16/3/22.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BBGamePadDirection_Top,
    BBGamePadDirection_Bottom,
    BBGamePadDirection_Left,
    BBGamePadDirection_Right,
} BBGamePadDirection;

@class BBGamePad;
@protocol BBGamePadDelegate <NSObject>

- (void)gamePad:(BBGamePad *)gamePad didMoveHandShankWithDirection:(BBGamePadDirection)direcation;

@end

@interface BBGamePad : UIView

@property (nonatomic, weak) id<BBGamePadDelegate> delegate;

@end
