//
//  HelloWorldLayer.m
//  ArrowWar
//
//  Created by Kuma on 12-1-3.
//  Copyright Mouselife.net 2012年. All rights reserved.
//


// Import the interfaces
#import "BaseScence.h"
#import "GameScence.h"

// HelloWorldLayer implementation
@implementation BaseScence

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	BaseScence *layer = [BaseScence node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		[self createBaseView:0];
	}
	return self;
}

-(void)createBaseView:(int)noParams{
    // ask director the the window size
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    CCSprite* bg = [CCSprite spriteWithFile:@"startBg.png"];
    bg.anchorPoint = CGPointMake(0.5, 0.5);
    bg.position = CGPointMake(size.width/2, size.height/2);
    
    CCSprite* nomarlStartBtn = [CCSprite spriteWithFile:@"startBtn.png"];
    CCSprite* selectStartBtn = [CCSprite spriteWithFile:@"startBtn.png"];
    selectStartBtn.color = ccRED;
    
    CCMenuItem *startMenuItem = [CCMenuItemSprite itemFromNormalSprite:nomarlStartBtn selectedSprite:selectStartBtn
                                               target:self selector:@selector(startEvent:)];
    
    CCMenu *startMenu = [CCMenu menuWithItems:startMenuItem, nil];
    startMenu.position = CGPointMake(size.width/2 - 50, 40);
    
    [self addChild:bg];
    [self addChild:startMenu];
    
}
                             
-(void)startEvent:(id)sender{
    NSLog(@"this is a touch event");
    CCScene* scene = [GameScence scene];
   // CCTransitionFadeBL* transition = [CCTransitionFadeBL transitionWithDuration:1 scene:scene];
    CCTransitionSlideInR* transition = [CCTransitionSlideInR transitionWithDuration:0.5 scene:scene];
    [[CCDirector sharedDirector] replaceScene:transition];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
