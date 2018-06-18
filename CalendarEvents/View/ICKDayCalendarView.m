//
//  ICKDayCalendarView.m
//  CalendarEvents
//
//  Created by zhangrongwu on 2018/6/18.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "ICKDayCalendarView.h"
#import "ICKDayCollectionViewCell.h"
#import "ICKHoursView.h"
#import "ICKCalendarEvent.h"
#import "NSDate+Calendar.h"

// 上下滑动scrollview
@interface ICKDayScrollView : UIScrollView <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)id data;
@end

@implementation ICKDayScrollView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.collectionView];
        [self setContentSize:CGSizeMake(self.frame.size.width, [ICKHoursView getHoursViewTotalHeight])];// 根据24小时定
    }
    return self;
}

-(void)setData:(id)data {
    _data = data;
    
    [self.collectionView reloadData];
}

#pragma mark -UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ICKDayCollectionViewCell *cell = (ICKDayCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ICKDayCollectionViewCell class]) forIndexPath:indexPath];
    cell.events = self.data[@"events"];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击");
}


-(UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.itemSize = CGSizeMake(self.frame.size.width, [ICKHoursView getHoursViewTotalHeight]);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [ICKHoursView getHoursViewTotalHeight]) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[ICKDayCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ICKDayCollectionViewCell class])];
        
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.alwaysBounceVertical = NO;
    }
    return _collectionView;
}
@end


// 最外层view
@interface ICKDayCalendarView()
@property (nonatomic, strong)ICKDayScrollView *scrollView;
@property (nonatomic, strong)NSMutableDictionary *eventDict;
@end

@implementation ICKDayCalendarView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.scrollView];
        [self randomEvents];
        self.scrollView.data = self.eventDict;
    }
    return self;
}
- (void)randomEvents {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        ICKCalendarEvent *event = [[ICKCalendarEvent alloc] init];
        event.beginDate = [NSDate date];
//        NSDateComponents *comp = [NSDate componentsWithHour:20 min:20];
//        event.endDate = [NSDate dateWithYear:2018 month:6 day:18];
        event.endDate = [NSDate dateWithTimeIntervalSinceNow:5000 / (i+1)];
        event.eventId = [NSString stringWithFormat:@"%d",i];
        [list addObject:event];
    }
    [self.eventDict setObject:[NSDate date] forKey:@"date"];
    [self.eventDict setObject:list forKey:@"events"];
}


-(NSMutableDictionary *)eventDict {
    if (!_eventDict) {
        _eventDict = [[NSMutableDictionary alloc] init];
    }
    return _eventDict;
}

-(ICKDayScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[ICKDayScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

@end







