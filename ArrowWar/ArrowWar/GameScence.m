//
//  GameScence.m
//  ArrowWar
//
//  Created by Kuma on 12-1-3.
//  Copyright 2012年 Mouselife.net. All rights reserved.
//

#import "GameScence.h"
#import "GameData.h"
#import "ActiveLayer.h"
#import "YellowActor.h"


@implementation GameScence 
BOOL isFlying = NO;
//@synthesize currentArrow = _currentArrow;
//int gameLevel = 1;

GameData *gameData;
CCSprite *currentArrow;
ActiveLayer *activeNode;

float adx = 0;
float ady = 0;
float dr = 0;
float dl = 0;
float pw = 0;
int shotType = 0;

float friction = 0.999;
float gravity = 1.2;
float wind = 0;//-1to1
int lenums = 7;

float screenWidth = 0;

YellowActor *yellowMan;

CGPoint startPoint;

+(id) scene
{
	CCScene* scene = [CCScene node];
	CCLayer* layer = [GameScence node];
	[scene addChild:layer];
	return scene;
}
-(id)init{
    if (self == [super init]) {
        [self createGameView:0];
    }
    return self;
}

-(void)createGameView:(int)noParmas{
    
    self.isTouchEnabled = true;
    
    CGSize size = [[CCDirector sharedDirector] winSize]; 
    gameData = [GameData getInstance];
    
    CCSprite* bg = [CCSprite spriteWithFile:@"gameBg.png"];
    bg.anchorPoint = CGPointMake(0,0);
    screenWidth = bg.contentSize.width;
    
    CCSprite* woode = [CCSprite spriteWithFile:@"woode.png"];
    woode.anchorPoint = CGPointMake(0, 0);
    woode.position = CGPointMake(500, -20);
    
    CCSprite* board = [CCSprite spriteWithFile:@"board.png"];
    board.anchorPoint = CGPointMake(0, 0);
    board.position = CGPointMake(0, 0);
    
    yellowMan = [YellowActor node];
    yellowMan.position = CGPointMake(300, 0);
    
    activeNode = [ActiveLayer node];
    activeNode.isTouchEnabled = true;
    activeNode.position = CGPointMake(0, 0);
    activeNode.tag = 1024;
    
    CCNode* arrowNode = [CCNode node];
    arrowNode.anchorPoint = CGPointMake(0, -1);
    arrowNode.tag = 1023;
    
    CCSprite* myArrow = [CCSprite spriteWithFile:@"arrow.png"];
    myArrow.anchorPoint = CGPointMake(0, 0.5);
    [arrowNode addChild:myArrow];
    
    [activeNode addChild:bg];
    [activeNode addChild:woode];
    [activeNode addChild:yellowMan];
    [activeNode addChild:arrowNode];
    [activeNode addChild:board];

    [self addChild:activeNode];
    [self startGame:5];
}
//开始游戏入口
-(void) startGame:(int)level{
    gameData.gameLevel = level;
    NSLog(@"%d started",gameData.gameLevel);
    [self clearAllobjects];
    [self setLevelData];
    [self creatInitLevelObjects];
    [self toStart];
}
//驱动所有元素运动
-(void)activeAllObjects{
    [self scheduleUpdate];
}
//停止所有元素运动
-(void)stopAllObjects{
    [self unscheduleUpdate];
}
//驱动实现
-(void) update:(ccTime)delta
{
    if (isFlying) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        ady = ady - gravity;
        adx = (adx * friction) + (wind / 4);
        ady = ady * friction;
        currentArrow.rotation = -atan2f(ady, adx) / (M_PI / 180);
        CGPoint nextPoint = CGPointMake(0, 0);
        nextPoint.x = currentArrow.position.x + (adx / lenums);
        nextPoint.y = currentArrow.position.y + (ady / lenums);
        currentArrow.position = nextPoint;
        float downY = currentArrow.contentSize.width * sinf(currentArrow.rotation*M_PI/180);
        if (currentArrow.rotation >= 0 ) {
            downY = currentArrow.position.y - downY;
        } else {
            downY = currentArrow.position.y + downY;
        }
        //downY = 0;
       // NSLog(@"arrowY:%f)
        // trace(90*Math.sin(30 * Math.PI/180))
        //trace(90*Math.cos(30 * Math.PI/180))
        float moveX = 0;
        if(shotType == 0){
            if (nextPoint.x > size.width/2 ) {
                moveX = -(nextPoint.x - size.width/2);
            }
        }else{
            if ((nextPoint.x + activeNode.position.x) < size.width/2) {
                moveX = -(nextPoint.x - size.width/2);
            }
        }
        
        if(moveX < size.width - screenWidth){
            moveX = size.width - screenWidth;
        }else if(moveX > 0 ){
            moveX = 0;
        }
        
        activeNode.position = CGPointMake(moveX, activeNode.position.y);
        if (downY < 35) {
            isFlying = NO;
            activeNode.isTouchEnabled = YES;
            startPoint = CGPointMake(currentArrow.position.x + activeNode.position.x, currentArrow.position.y);
            [self stopAllObjects];
            NSLog(@"out of the stage");
        }
    }else{
        NSLog(@"stop enterframe");
    }
}
//更新关卡数据
-(void)setLevelData{
    //to set level data
    shotType = 0;
}
//清理场景
-(void)clearAllobjects{
    int num=0;
    CCNode* arrowNode = [activeNode getChildByTag:1023];
    for (CCSprite *arrow in [arrowNode children]) {
        num++;
        [arrowNode removeChild:arrow cleanup:YES];
    }
    activeNode.isTouchEnabled = NO;
    currentArrow = nil;
    NSLog(@"there are left %d in scene!",num);
}
//创建关卡初始角色
-(void)creatInitLevelObjects{
    CGSize size = [[CCDirector sharedDirector] winSize]; 
    currentArrow = [CCSprite spriteWithFile:@"arrow.png"];
    currentArrow.anchorPoint = CGPointMake(0, 0.5);
    currentArrow.position = CGPointMake(100,size.height/2 );
    CCNode* arrowNode = [activeNode getChildByTag:1023];
    currentArrow.position = CGPointMake(5, 90);
    [arrowNode addChild:currentArrow];
    startPoint =CGPointMake(currentArrow.position.x + activeNode.position.x, currentArrow.position.y);
}
//正式开始游戏
-(void)toStart{
    activeNode.isTouchEnabled = YES;
    //[self activeAllObjects];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch!");
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event  
{  
    if(gameData.isActiveDown){
        UITouch *touch = [touches anyObject];

        CGPoint location = [touch locationInView:[touch view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        
        dl = atan2f(-(location.y - startPoint.y), (location.x - startPoint.x));
        dr = dl * 180 / M_PI;
        pw = sqrtf((location.y - startPoint.y) * (location.y - startPoint.y) + (location.x - startPoint.x) * (location.x - startPoint.x)) * 2;
        
        /*if(shotType == 0){
            float myp = (int)(dl * 180 / M_PI) - 180;
            if(myp < -60 && myp >= -180){
                dr = -60;
            }else if(myp < -180 && myp >-351){
                dr = 10;
            }else if(myp <= -351 && myp >=-360){
                dr = myp + 360;
            }else if(myp <= 0 && myp >= -60){
                dr = myp;
            }
                     
                     
        }else{
            if(dr <= 140 && dr > 0){
                dr = 140;
            }else if(dr >= -140 && dr <= 0){
                dr = -140;
            }
        }*/
        
        if(pw > 300){
            pw = 300;
        }
        pw*=0.2;
        adx = pw * cosf((dr * M_PI) / 180);
        ady = -pw * sinf((dr * M_PI) / 180);
        
        currentArrow.rotation = dr;
        NSLog(@"locaction>>dr:%f,pw:%f",dr,pw);
       // NSLog(@"distance:%f",dr);
    }
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  
{  
    if (gameData.isActiveDown) {
        gameData.isActiveDown = NO;
        if (isFlying == NO) {
            [self toShot];
        }
    }
    
} 

-(void)toShot{
    NSLog(@"to shot");
    isFlying = YES;
    activeNode.isTouchEnabled = NO;
    [self activeAllObjects];
}

-(CGPoint) getArrowHeadPosition{
   // trace(90*Math.sin(30 * Math.PI/180))
    //trace(90*Math.cos(30 * Math.PI/180))
}


@end
