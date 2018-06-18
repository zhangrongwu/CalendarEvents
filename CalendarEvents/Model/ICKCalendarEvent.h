//
//  ICKCalendarEvent.h
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICKCalendarEvent : NSObject
@property (nonatomic, strong)NSString *eventId;
@property (nonatomic, strong)NSDate *beginDate;
@property (nonatomic, strong)NSDate *endDate;

@end
