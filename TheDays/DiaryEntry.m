//
//  DirayEntry.m
//  TheDays
//
//  Created by nathan on 16/3/6.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import "DiaryEntry.h"

@implementation DiaryEntry

// Insert code here to add functionality to your managed object subclass


@dynamic body;
@dynamic date;
@dynamic futureDate;
@dynamic imageData;
@dynamic location;
@dynamic mood;
@dynamic weather;
@dynamic weatherImageData;

@synthesize sectionName = _sectionName;

- (NSString *)sectionName
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM yyyy"];
    return [dateFormatter stringFromDate:date];
}


@end
