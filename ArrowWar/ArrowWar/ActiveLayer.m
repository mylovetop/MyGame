//
//  ActiveLayer.m
//  ArrowWar
//
//  Created by Kuma on 12-1-5.
//  Copyright 2012年 Mouselife.net. All rights reserved.
//

#import "ActiveLayer.h"
#import "GameData.h"


@implementation ActiveLayer
GameData *gameData;
-(id)init{
    if (self == [super init]) {
        self.isTouchEnabled = true;
        gameData = [GameData getInstance];
    }
    return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    gameData.isActiveDown = true;
    NSLog(@"touch with Active Layer!");
}
@end
