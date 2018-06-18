//
//  ICKHourItemView.m
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "ICKHourItemView.h"
#import "NSDate+Calendar.h"

@interface ICKHourItemView()
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIView *lineView;
@end

@implementation ICKHourItemView
- (id)initWithFrame:(CGRect)frame date:(NSDate *)date {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.timeLabel];
        [self addSubview:self.lineView];
        NSDateComponents *comp = [NSDate componentsOfDate:date];
        self.itemDate = date;
        self.timeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld", comp.hour, comp.minute];
    }
    return self;
}

-(UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(10, 10, 60, 30);
    }
    return _timeLabel;
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(60, 25, self.frame.size.width - 60, 0.5);
        _lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _lineView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
