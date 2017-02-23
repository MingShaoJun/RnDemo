//
//  RoutePlanSDK.m
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/21.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "RoutePlanSDK.h"
#import "aMapRouteView.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "AMapRouteView.h"

@implementation RoutePlanSDK
RCT_EXPORT_MODULE()



RCT_EXPORT_VIEW_PROPERTY(aMapRouteLoad, NSDictionary)

- (UIView *)view
{
 
    routeView=[[AMapRouteView alloc]init];
    
    return routeView;
}
RCT_REMAP_METHOD(routePlanActionMultipdd,datex:(float)x datexy:(float)y width:(float)width height:(float)height)
{
    
    [routeView routePlanActionMultipddDatex:x datexy:y width:width height:height];
}



#pragma mark - 通用触发事件
#pragma mark -路线规划
RCT_REMAP_METHOD(routePlanActionMultiple,isMultiple:(BOOL)isMultiple)
{
    
    [routeView routePlanActionMultiple:isMultiple];
}
#pragma mark -选中条件
RCT_REMAP_METHOD(onChoice,numberTag:(NSInteger)Tag){
    [routeView onChoice:Tag];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
@end
