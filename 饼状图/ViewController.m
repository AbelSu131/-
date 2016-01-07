//
//  ViewController.m
//  饼状图
//
//  Created by abel on 16/1/6.
//  Copyright © 2016年 abel. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

static inline UIColor *GetRandomUIColor() //对随机产生颜色的获取
{
    //生成随机值
    CGFloat r = arc4random() % 255;
    CGFloat g = arc4random() % 255;
    CGFloat b = arc4random() % 255;
    UIColor * color = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha: 1.0f];
    return color; //返回颜色
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    pieView = [[PieView alloc]initWithFrame:CGRectMake(35.0f, 35.0f, 250.0f, 250.0f)];
    pieView.delegate = self; //设置协议
    pieView.datasource = self;  //设置委托
    [vv addSubview:pieView];
    
    holeSlider.tag = 7; //设置tag值
    holeSlider.minimumValue = 0.0f;
    holeSlider.maximumValue = 250/2 - 1; //设置最大值
    int max = holeSlider.maximumValue;
    holeSlider.value = arc4random() % max;
    
    slicesSlider.tag = 77; //设置tag值
    slicesSlider.minimumValue = 0.0f;
    slicesSlider.maximumValue = 100.0f;
    slicesSlider.value = arc4random() % 100; //设置当前的值
    
}

- (IBAction)Change:(UISlider *)slider{
    if (slider.tag == 77)
        valueLabel.text = [NSString stringWithFormat:@"%.0f",slider.value]; //设置标签内容
    if (slider.tag == 7)
        holeLabel.text = [NSString stringWithFormat:@"%.0f",slider.value]; //设置标签内容
    [pieView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)centerCircleRadius
{
    return holeSlider.value;
}

-(int)numberOfSlicesInPieChartView:(PieView *)pieChartView
{
    return slicesSlider.value;
}
-(UIColor *)pieChartView:(PieView *)pieChartView colorForSliceAtIndex:(NSUInteger)index
{
    return GetRandomUIColor();
}
-(double)pieChartView:(PieView *)pieChartView valueForSliceAtIndex:(NSUInteger)index
{
    return 100/slicesSlider.value;
}

@end
