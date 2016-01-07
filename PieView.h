//
//  PieView.h
//  饼状图
//
//  Created by abel on 16/1/6.
//  Copyright © 2016年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PieView;

//PieViewDelegate协议
@protocol PieViewDelegate <NSObject>
- (CGFloat)centerCircleRadius;
@end

//PieViewDataSource协议
@protocol PieViewDataSource <NSObject>
@required
- (int)numberOfSlicesInPieChartView:(PieView *)pieChartView; //获取切片个数
- (double)pieChartView:(PieView *)pieChartView valueForSliceAtIndex:(NSUInteger)index; //获取切片的值
- (UIColor *)pieChartView:(PieView *)pieChartView colorForSliceAtIndex:(NSUInteger)index; //获取切片的颜色
@optional
- (NSString *)pieChartView:(PieView *)pieChartViewtitleForSliceAtIndex:(NSUInteger)index;
@end

@interface PieView : UIView
//属性
@property (nonatomic,assign) id <PieViewDataSource> datasource;
@property (nonatomic,assign) id <PieViewDelegate> delegate;
- (void)reloadData; //加载数据
@end
