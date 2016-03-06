//
//  DirayEntry.h
//  TheDays
//
//  Created by nathan on 16/3/6.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>





@interface DiaryEntry : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
@property (nonatomic, retain) NSString *body;
@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSDate *futureDate;
@property (nonatomic, retain) NSData *imageData;
@property (nonatomic, retain) NSString *location;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString *weather;
@property (nonatomic, retain) NSData *weatherImageData;

@property (nonatomic, strong) NSString *sectionName;

@end



