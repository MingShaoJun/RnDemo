//
//  EventEmitterTool.m
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/21.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "EventEmitterTool.h"

@implementation EventEmitterTool
RCT_EXPORT_MODULE();
static EventEmitterTool *eventShare;

+sharedInstance{
    @synchronized (self) {
        eventShare=[[EventEmitterTool alloc]init];
    }
    
    return eventShare;
}

RCT_EXPORT_METHOD(positionAction)
{
    

    mapView=[AMapView sharedInstance];
    mapView.delegate=self;
    
    [mapView positionAction];
    
//    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"ddddd",@"name", nil];
//    [self isPosition:dic];
    
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"isPosition"];//有几个就写几个
}

-(void)iseCallback:(NSString*)code result:(NSString*) result
{
//    [self sendEventWithName:@"isPosition"
//                       body:@{
//                              @"code": code,
//                              @"result": result,
//                              }];
}

-(void)isPosition:(NSString*)code data:(NSDictionary *)dic{
    [self sendEventWithName:code
                       body:dic];
}
-(void)aMapDelegateCode:(NSString *)code data:(NSDictionary *)dic;
{
    [self isPosition:code data:dic];
}
@end
