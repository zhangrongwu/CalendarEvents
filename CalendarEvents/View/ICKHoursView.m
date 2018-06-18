//
//  ICKHoursView.m
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "ICKHoursView.h"
#import "NSDate+Calendar.h"


@interface ICKHoursView()


@end
@implementation ICKHoursView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat y = 0;
//        NSDateComponents *compNow = [NSDate componentsOfCurrentDate];
        for (int hour = 0; hour <= 23; hour++) {
            for (int min = 0; min <= 45; min=min+MINUTES_PER_LABEL) {
                // 组合时间
//                if (min == 0 || min == 30) {
                    ICKHourItemView *item = [[ICKHourItemView alloc] initWithFrame:CGRectMake(0, y, self.frame.size.width, HEIGHT_CELL_MIN) date:[NSDate dateWithHour:hour min:min]];
                    [self addSubview:item];
                    [self.hourItems addObject:item];
//                }
                y += HEIGHT_CELL_MIN;
            }
        }
        self.totalHeight = y;
    }
    return self;
}

+(CGFloat)getHoursViewTotalHeight {
    CGFloat y = 0;
    for (int hour = 0; hour <= 23; hour++) {
        for (int min = 0; min <= 45; min=min+MINUTES_PER_LABEL) {
            y += HEIGHT_CELL_MIN;
        }
    }
    return y;
}

-(NSMutableArray<ICKHourItemView *> *)hourItems {
    if (!_hourItems) {
        _hourItems = [[NSMutableArray alloc] init];
    }
    return _hourItems;
}

/*
 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
