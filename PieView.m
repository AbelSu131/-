//
//  PieView.m
//  饼状图
//
//  Created by abel on 16/1/6.
//  Copyright © 2016年 abel. All rights reserved.
//

#import "PieView.h"

@implementation PieView
//初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor= [UIColor clearColor];
        self.layer.shadowColor = [[UIColor blackColor]CGColor]; //设置阴影颜色
        self.layer.shadowOffset = CGSizeMake(0.0f, 2.5f); //获取阴影的偏移量xy
        self.layer.shadowRadius = 1.9f; //阴影半径
        self.layer.shadowOpacity = 0.9f; //阴影透明度
    }
    return self;
}

//绘制
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext(); //创建图像上下文
    CGFloat theHalf = rect.size.width/2;
    CGFloat lineWidth = theHalf;
    //判断是否执行了centerCircleRadius方法
    if ([self.delegate respondsToSelector:@selector(centerCircleRadius)])
    {
        lineWidth -= [self.delegate centerCircleRadius];
        NSAssert(lineWidth <= theHalf, @"wrong circle radius");
    }
    //为变量赋值
    CGFloat radius = theHalf-lineWidth/2;
    CGFloat centerX = theHalf;
    CGFloat centerY = rect.size.height/2;
    //绘制
    double sum = 0.0f;
    int slicesCount = [self.datasource numberOfSlicesInPieChartView:self]; //获取切片个数
    
    //循环，求和
    for (int i = 0; i < slicesCount; i++)
    {
        sum += [self.datasource pieChartView:self valueForSliceAtIndex:i];
    }
    float startAngle = - M_PI_2;
    float endAngle = 0.0f;
    //循环，绘制切片
    for (int i=0;i<slicesCount;i++)
    {
        double value = [self.datasource pieChartView:self valueForSliceAtIndex:i];
        endAngle = startAngle + M_PI*2*value/sum;
        CGContextAddArc( context,centerX ,centerY, radius, startAngle, endAngle, false); //添加弧
        UIColor *drawColor = [self.datasource pieChartView:self colorForSliceAtIndex:i];
        CGContextSetStrokeColorWithColor(context, drawColor.CGColor); //设置线的颜色
        CGContextSetLineWidth(context, lineWidth); //设置线的宽度
        CGContextStrokePath(context); //绘制
        startAngle += M_PI*2*value/sum;
    }
    
}

//加载视图
-(void)reloadData
{
    [self setNeedsDisplay];
}


@end
