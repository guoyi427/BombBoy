//
//  BBGameViewController.m
//  BombBoy
//
//  Created by guoyi on 16/3/22.
//  Copyright © 2016年 郭毅. All rights reserved.
//

#import "BBGameViewController.h"

//  View
#import "BBGameBackgroundView.h"
#import "BBGamePad.h"

@interface BBGameViewController() <BBGamePadDelegate>

@end

@implementation BBGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _prepareBackgroundView];
    [self _prepareGamePad];
}

- (void)_prepareBackgroundView {
    BBGameBackgroundView *backgroundView = [[BBGameBackgroundView alloc] initWithFrame:CGRectMake(-Screen_Width, -Screen_Height,
                                                                                                  Screen_Width * 3, Screen_Height * 3)];
    [self.view addSubview:backgroundView];
}

- (void)_prepareGamePad {
    BBGamePad *gamePad = [[BBGamePad alloc] initWithFrame:CGRectMake(50, Screen_Height - 150, 100, 100)];
    gamePad.delegate = self;
    [self.view addSubview:gamePad];
}

#pragma mark - GamePad - Delegate

- (void)gamePad:(BBGamePad *)gamePad didMoveHandShankWithDirection:(BBGamePadDirection)direcation {
    NSLog(@"direction = %ld",direcation);
}

@end
