//
//  DiaryEntry+CoreDataProperties.h
//  TheDays
//
//  Created by nathan on 16/3/7.
//  Copyright © 2016年 nathanwty. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DiaryEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiaryEntry (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSDate *futureDate;
@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSNumber *mood;
@property (nullable, nonatomic, retain) NSString *weather;
@property (nullable, nonatomic, retain) NSData *weatherImageData;

@end

NS_ASSUME_NONNULL_END
