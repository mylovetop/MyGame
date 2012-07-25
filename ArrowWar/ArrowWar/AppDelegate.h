//
//  AppDelegate.h
//  ArrowWar
//
//  Created by Kuma on 12-1-3.
//  Copyright Mouselife.net 2012年. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window_;
	RootViewController	*viewController_;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;

@end
