//
//  GameData.h
//  ArrowWar
//
//  Created by Kuma on 12-1-3.
//  Copyright (c) 2012年 Mouselife.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#define YELLOW_HEAD_FRAMES 9
@interface GameData : NSObject{
    int _gameLevel;
    BOOL _isActiveDown;
    float dataArr[2][3];
}
@property (nonatomic) int gameLevel;
@property(nonatomic) BOOL isActiveDown;
+(GameData*)getInstance;
-(void)initData;
@end
