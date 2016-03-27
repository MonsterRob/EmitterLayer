//
//  ViewController.m
//  粒子效果1
//
//  Created by 王召洲 on 16/3/27.
//  Copyright © 2016年 王召洲. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     
     */
    //CADisplayLink 类似于定时器
    //CAEmitterCell
    //CAEmitterBehavior
    //CAEmitterLayer
    CAEmitterLayer *emitterLayer=[CAEmitterLayer layer];
    emitterLayer.frame=self.view.bounds;
    emitterLayer.emitterPosition=CGPointMake(self.view.bounds.size.width*0.5, -20);//辐射源中心点位置
    emitterLayer.emitterSize=CGSizeMake(self.view.bounds.size.width, 20);//辐射源大小
    emitterLayer.seed=2;
    emitterLayer.emitterShape=kCAEmitterLayerLine;//辐射源形状
    emitterLayer.renderMode=kCAEmitterLayerAdditive;//渲染模式
    [self.view.layer addSublayer:emitterLayer];

    CAEmitterCell *cell=[CAEmitterCell emitterCell];
    cell.contents=(__bridge id _Nullable)([UIImage imageNamed:@"bz.png"].CGImage);
    cell.birthRate=50;//每秒辐射的粒子数
    cell.lifetime=15.0;//粒子平局生命周期
    cell.lifetimeRange=5;
    
    cell.alphaSpeed=-0.1;
    
    cell.velocity=150;
    cell.velocityRange=100;//平均速率与速率变化范围，则速率在100-200之间,方向随机
    
    cell.emissionRange=M_PI*0.5;//角度范围
    cell.emissionLongitude=M_PI;//水平角度，这两个组合让辐射方向为水平向下
    
    cell.spin=M_PI*0.25;
    cell.spinRange=M_PI*0.25;//粒子旋转平均角度与角度变化范围
    
    emitterLayer.emitterCells=@[cell];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
