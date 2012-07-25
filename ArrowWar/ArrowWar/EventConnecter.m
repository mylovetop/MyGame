//
//  EventConnecter.m
//  ArrowWar
//
//  Created by Kuma on 12-1-6.
//  Copyright (c) 2012年 Mouselife.net. All rights reserved.
//

#import "EventConnecter.h"

@implementation EventConnecter
+(EventConnecter*)getInstance{
    static EventConnecter*instance;
    @synchronized(self){
        if(!instance){
            instance = [[EventConnecter alloc] init];
        }
    }
    return instance;
}

-(void)pasuseAllGameActions{
    
}

-(void)resumeAllGameActions{
    
}

-(void)activeNodeTuchDown{
    
}

-(void)activeNodeTuchMove{
    
}

-(void)activeNodeTuchUp{
    
}
@end
