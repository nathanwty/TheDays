//
//  TextEditViewController.h
//  TheDays
//
//  Created by nathan on 16/2/29.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DiaryEntry.h"
#import "VLDContextSheet.h"


@interface TextEditViewController : UIViewController<VLDContextSheetDelegate>


@property (nonatomic, strong) DiaryEntry *entry;
@property (strong, nonatomic) VLDContextSheet *contextSheet;




@end
