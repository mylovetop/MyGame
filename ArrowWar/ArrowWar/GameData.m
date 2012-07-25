//
//  GameData.m
//  ArrowWar
//
//  Created by Kuma on 12-1-3.
//  Copyright (c) 2012年 Mouselife.net. All rights reserved.
//

#import "GameData.h"

@implementation GameData
@synthesize gameLevel = _gameLevel;
@synthesize isActiveDown = _isActiveDown;
+(GameData*)getInstance{
    static GameData *instance;
    @synchronized(self){
        if(!instance){
            instance = [[GameData alloc] init];
        }
    }
    return instance;
}
-(id)init{
    
    if (self == [super init]) {
        [self initData];
    }
    return self;
}
-(void)initData{
    _gameLevel = 1;
    int i,j;
    float arr[2][3] = {{1.0,2.5,3.5},{9,5,3}};
    memcpy(dataArr, arr, sizeof(arr));
    for(i=0;i<2;i++){
        for(j=0;j<3;j++){
            //dataArr[i][j]=arr[i][j];
            NSLog(@"for out i:%d,j:%d,value:%f",i,j,dataArr[i][j]);
        }
    }

    NSLog(@"now init the gamedatas");
}
@end
