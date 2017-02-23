//
//  EventEmitterTool.h
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/21.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "RCTEventEmitter.h"
#import "AMapView.h"

@interface EventEmitterTool : RCTEventEmitter<RCTBridgeModule,aMapDelegate>
{
    AMapView *mapView;
}

+sharedInstance;
-(void)isPosition:(NSString*)code data:(NSDictionary *)dic;
@end
