//
//  NSDate+Calendar.h
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Calendar)
+ (NSDateComponents *)componentsOfCurrentDate;
+ (NSDateComponents *)componentsOfDate:(NSDate *)date;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)dateWithHour:(NSInteger)hour min:(NSInteger)min;
+ (NSDateComponents *)componentsWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDateComponents *)componentsWithHour:(NSInteger)hour min:(NSInteger)min;
@end
