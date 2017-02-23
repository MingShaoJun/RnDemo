//
//  aMapRouteView.m
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/22.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "AMapRouteView.h"
#import "DriveRoutePlanViewController.h"

@interface  AMapRouteView ()

@property (nonatomic, strong) DriveRoutePlanViewController *myRouteView;
@property (nonatomic, strong) UIView *AMapRouteView;

@end

@implementation AMapRouteView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.AMapRouteView.frame=CGRectMake(0, 0, 20, 20);
    [self addSubview:self.AMapRouteView];

    
}
-(void)routePlanActionMultipddDatex:(float)x datexy:(float)y width:(float)width height:(float)height;
{
    [self.myRouteView routePlanActionMultipddDatex:x datexy:y width:width height:height];
}
-(void)drawRect:(CGRect)rect{
    
}
#pragma mark - 通用事件

-(void)routePlanActionMultiple:(BOOL)isMultiple{
    [_myRouteView routePlanActionMultiple:isMultiple];
}
-(void)onChoice:(NSInteger)tag{
    [_myRouteView onChoice:tag];
}

-(UIView *)AMapRouteView{
    if (!_AMapRouteView) {
        _myRouteView=[[DriveRoutePlanViewController alloc]init];
        _AMapRouteView=_myRouteView.view;
    }
    return _AMapRouteView;
}
#pragma mark -初始值
-(void)setAMapRouteLoad:(NSDictionary *)aMapRouteLoad{
    _myRouteView.aMapRouteLoad=aMapRouteLoad;
}
@end
