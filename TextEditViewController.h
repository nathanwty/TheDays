//
//  TextEditViewController.h
//  TheDays
//
//  Created by nathan on 16/2/29.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaryEntry.h"
#import "CDSideBarController.h"

@interface TextEditViewController : UIViewController<CDSideBarControllerDelegate>

{
    CDSideBarController *sideBar;
}

@property (nonatomic, strong) DiaryEntry *entry;



@end
