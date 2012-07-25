//
//  HelloWorldLayer.h
//  ArrowWar
//
//  Created by Kuma on 12-1-3.
//  Copyright Mouselife.net 2012年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface BaseScence : CCLayer
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void)createBaseView:(int)noParams;
-(void)startEvent:(id)sender;
@end
