//
//  kkk.m
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/21.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "kkk.h"

@implementation kkk

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
    self.backgroundColor=[UIColor blueColor];
    
    UIButton *BN=[[UIButton alloc]initWithFrame:CGRectMake( 0, 0, 60, 30)];
    [BN addTarget:self action:@selector(CLOSEACTION) forControlEvents:UIControlEventTouchDown];
    [BN setTitle:@"关闭" forState:UIControlStateNormal];
    BN.backgroundColor=[UIColor grayColor];
    [self addSubview:BN];
}
-(void)CLOSEACTION{
    NSLog(@"11");
}

@end
