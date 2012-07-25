//
//  BaseActor.h
//  ArrowWar
//
//  Created by Kuma on 12-1-8.
//  Copyright 2012年 Mouselife.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BaseActor : CCSprite {
    CCSprite *brow;
}
-(void)setRotain;//设置拉弓角度
-(void)shot;//射箭动画
-(void)setPowr;//设置拉弓的力量
-(void)beAttacked;//被击中动画
-(void)reset;//恢复
-(void)initWithBitmaps;
@end
