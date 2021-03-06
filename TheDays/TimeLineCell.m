//
//  TimeLineCell.m
//  TheDays
//
//  Created by nathan on 16/3/6.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import "TimeLineCell.h"
#import "DiaryEntry.h"

@interface TimeLineCell()


@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *loactionLabel;
@property (weak, nonatomic) IBOutlet UIView *dotView;
@property (weak, nonatomic) IBOutlet UIView *lineView;



@end

@implementation TimeLineCell


//draw circle
- (void)awakeFromNib {
    _dotView.layer.cornerRadius = 5.0;
}

+ (CGFloat)heightForEntry:(DiaryEntry *)entry {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 106.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [entry.body boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}

- (void)configureCellForEntry:(DiaryEntry *)entry {
    self.bodyLabel.text = entry.body;
    self.loactionLabel.text = entry.location;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE, MMMM d yyyy"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:entry.date];
    
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    



    
    if (entry.location.length > 0) {
        self.loactionLabel.text = entry.location;
    } else {
        self.loactionLabel.text = @"No location";
    }
}
 
@end
