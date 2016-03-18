//
//  AppDelegate.h
//  TheDays
//
//  Created by nathan on 16/2/9.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class TextEditViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TextEditViewController *viewController;

@end

