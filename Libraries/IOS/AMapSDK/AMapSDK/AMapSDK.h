//
//  AMapSDK.h
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/17.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import "RCTViewManager.h"
#import "AMapView.h"
#import "EventEmitterTool.h"



@interface AMapSDK : RCTViewManager<RCTBridgeModule>
{
    AMapView *mapView;
}

@end
