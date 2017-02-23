//
//  AMapSDK.m
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/17.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "AMapSDK.h"

//121.470137,31.25779 上海
//110.08221,20.963396 雷州
// 110.910089,21.704622 茂名

@implementation AMapSDK
RCT_EXPORT_MODULE()

- (UIView *)view
{
    mapView=[AMapView sharedInstance];
    return mapView;
}

RCT_EXPORT_METHOD(positionAction)
{
    [mapView positionAction];    
}


RCT_REMAP_METHOD(findEventsName,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    
    (@"哈哈");
    
}
//-(void)setAMapRouteLoad:(NSDictionary *)aMapRouteLoad{

RCT_REMAP_METHOD(AMapRouteLoadAction,aMapRouteLoad:(NSDictionary*)aMapRouteLoad)
{
    
    [mapView navigation:aMapRouteLoad];
   
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
@end
