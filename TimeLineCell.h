//
//  TimeLineCell.h
//  TheDays
//
//  Created by nathan on 16/3/6.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DiaryEntry;


@interface TimeLineCell : UITableViewCell

+ (CGFloat)heightForEntry:(DiaryEntry *)entry;

- (void)configureCellForEntry:(DiaryEntry *)entry;

@end
