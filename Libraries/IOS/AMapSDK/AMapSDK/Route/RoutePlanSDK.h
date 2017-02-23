//
//  RoutePlanSDK.h
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/21.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "RCTViewManager.h"
#import "DriveRoutePlanViewController.h"
#import "AMapRouteView.h"

@interface RoutePlanSDK : RCTViewManager
{
    AMapRouteView *routeView;
}
@end
