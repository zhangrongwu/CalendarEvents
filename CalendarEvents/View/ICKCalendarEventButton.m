//
//  ICKCalendarEventButton.m
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "ICKCalendarEventButton.h"

@implementation ICKCalendarEventButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        
        self.titleLabel.numberOfLines = 0;
        [self setBackgroundColor:[UIColor colorWithRed:49./255. green:181./255. blue:247./255. alpha:0.5]];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
