//
//  GameScence.h
//  ArrowWar
//
//  Created by Kuma on 12-1-3.
//  Copyright 2012年 Mouselife.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameScence : CCLayer {
    //CCSprite *_currentArrow;
}
//@property(nonatomic) CCSprite *currentArrow;
-(void) createGameView:(int)noParmas;
-(void) startGame:(int)level;
-(void) clearAllobjects;
-(void) creatInitLevelObjects;
-(void) setLevelData;
-(void) activeAllObjects;
-(void) stopAllObjects;
-(void) toStart;
-(void) toShot;
@end
