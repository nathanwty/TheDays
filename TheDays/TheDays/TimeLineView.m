//
//  TimeLineView.m
//  TheDays
//
//  Created by nathan on 16/3/18.
//  Copyright © 2016年 nathanwty. All rights reserved.
//

#import "TimeLineView.h"

@implementation TimeLineView


#define TopDotViewCentX 40//上方圆点中心 x坐标
#define VerticalLineWidth 5//时间轴 线条 宽度
#define ButtomDotViewCentX 40//底部圆点中心 x坐标



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    
    verticalLineTopView = [[UIView alloc] init];
    verticalLineTopView.backgroundColor = [UIColor grayColor];
    [self addSubview:verticalLineTopView];
    
    int dotViewRadius = 7;
    dotView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dotViewRadius * 2, dotViewRadius * 2)];
    dotView.backgroundColor = [UIColor colorWithRed:77.0/255.0 green:164.0/255.0 blue:191.0/255.0 alpha:1.0f];
    dotView.layer.cornerRadius = dotViewRadius;
    [self addSubview:dotView];
    
    
    
    
    
    
}


@end
