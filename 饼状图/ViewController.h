//
//  ViewController.h
//  饼状图
//
//  Created by abel on 16/1/6.
//  Copyright © 2016年 abel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieView.h"

@interface ViewController : UIViewController<PieViewDataSource,PieViewDelegate>{
    //声明关于视图的插座变量
    IBOutlet UIView *vv;
    //声明关于滑块控件的插座变量
    IBOutlet UISlider *holeSlider;
    IBOutlet UISlider *slicesSlider;
    //声明关于标签的插座变量
    IBOutlet UILabel *holeLabel;
    IBOutlet UILabel *valueLabel;
    PieView *pieView;
}

- (IBAction)Change:(UISlider*)slider;


@end

