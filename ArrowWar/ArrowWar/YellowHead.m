//
//  YellowHead.m
//  ArrowWar
//
//  Created by Kuma on 12-1-8.
//  Copyright 2012年 Mouselife.net. All rights reserved.
//

#import "YellowHead.h"
#import "GameData.h"


@implementation YellowHead
-(id)init{
    if (self == [super init]) {
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        NSMutableArray *frames = [[NSMutableArray array] retain];
        // 构造每一个帧的实际图像数据
        for (int i = 1; i <= YELLOW_HEAD_FRAMES ; i++) {
            NSString *frameName = [NSString stringWithFormat:@"yellowHead%04d.png", i];
            CCSpriteFrame *frame = [cache spriteFrameByName:frameName];
            [frames addObject:frame];
        }
       
        NSString *firstFrameName = [NSString stringWithFormat:@"yellowHead%04d.png", 1];
        CCSprite *sprite = [CCSprite spriteWithSpriteFrameName:firstFrameName];
        sprite.anchorPoint = CGPointMake(0, 0);
        //sprite.position = CGPointMake(0, 0);
        /*
        CCAnimation *animation = [CCAnimation animationWithFrames:frames
                                                          delay:1.0f / 30];
        [sprite runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation
                                                                      restoreOriginalFrame:NO]]];
         */
         
        // 将构造好的动画加入显示列表
        [self addChild:sprite];
    }
    return self;
}
@end
