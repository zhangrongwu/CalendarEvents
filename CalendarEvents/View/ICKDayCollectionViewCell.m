//
//  ICKDayCollectionViewCell.m
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "ICKDayCollectionViewCell.h"
#import "ICKCalendarEventButton.h"
#import "ICKHourItemView.h"
#import "NSDate+Calendar.h"

@implementation ICKDayCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.hoursView = [[ICKHoursView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.hoursView];
    }
    return self;
}

-(void)setEvents:(NSArray<ICKCalendarEvent *> *)events {
    _events = events;
    
    [self addEventButtonsWithArray:events];
}

- (void)addEventButtonsWithArray:(NSArray *)array {
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[ICKCalendarEventButton class]]) {
            [subView removeFromSuperview];
        }
    }
    
    // 根据事件以及时间进行铺设button
    if (array) {
        for (ICKCalendarEvent *event in array) {
            // 同一个时间点进行优化处理
            CGFloat yTimeBegin;
            CGFloat yTimeEnd;
            for (ICKHourItemView *item in self.hoursView.hourItems) {
                NSDateComponents *compItem = [NSDate componentsOfDate:item.itemDate];
                NSDateComponents *compEventBegin = [NSDate componentsOfDate:event.beginDate];
                NSDateComponents *compEventEnd = [NSDate componentsOfDate:event.endDate];
                
                if (compItem.hour == compEventBegin.hour && compItem.minute <= compEventBegin.minute && compEventBegin.minute < compItem.minute+MINUTES_PER_LABEL) {
                    yTimeBegin = item.frame.origin.y+item.frame.size.height/2.;
                    NSLog(@" begin ----- %f", yTimeBegin);
                }
                if (compItem.hour == compEventEnd.hour && compItem.minute <= compEventEnd.minute && compEventEnd.minute < compItem.minute+MINUTES_PER_LABEL) {
                    yTimeEnd = item.frame.origin.y+item.frame.size.height;
                    NSLog(@" end ----- %f", yTimeEnd);
                }
            }
            ICKCalendarEventButton *button = [[ICKCalendarEventButton alloc] initWithFrame:CGRectMake(80, yTimeBegin, 100, yTimeEnd - yTimeBegin)];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            button.event = event;
            [self addSubview:button];
        }
    }
}

-(void)buttonAction:(ICKCalendarEventButton *)sender {
    NSLog(@"%@", sender.event.eventId);
}


@end
