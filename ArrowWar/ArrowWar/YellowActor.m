//
//  YellowActor.m
//  ArrowWar
//
//  Created by Kuma on 12-1-8.
//  Copyright 2012年 Mouselife.net. All rights reserved.
//

#import "YellowActor.h"
#import "YellowHead.h"
#import "GameData.h"


@implementation YellowActor
YellowHead *head;
CCSprite *body;
-(id)init{
    if (self == [super init]) {
        [self initWithBitmaps];
    }
    
    return self;
}
-(void)initWithBitmaps{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"yellowHead.plist"];
    CCSpriteBatchNode *headsheet = [CCSpriteBatchNode batchNodeWithFile:@"yellowHead.png"];
    [self addChild:headsheet];
    
    body = [CCSprite spriteWithFile:@"yellowBody.png"];
    body.anchorPoint = CGPointMake(0, 0);
    body.position = CGPointMake(0, 0);
    
    head = [YellowHead node];
    head.anchorPoint = CGPointMake(68/512, 62/512);
    head.position = CGPointMake(0, 0);
    
    [self addChild:body];
    [self addChild:head];
    
    [self scheduleUpdate];
}
-(void) update:(ccTime)delta{
    //head.rotation = head.rotation+0.1;
}
@end
