//
//  SpaceShootAppController.h
//  SpaceShoot
//
//  Created by zdsoft on 12-7-24.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

@class RootViewController;

@interface AppController : NSObject <UIAccelerometerDelegate, UIAlertViewDelegate, UITextFieldDelegate,UIApplicationDelegate> {
    UIWindow *window;
    RootViewController    *viewController;
}

@end

