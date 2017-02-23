//
//  AMapSDK.h
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/17.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
#import <MAMapKit/MAMapKit.h>
#import "RCTViewManager.h"
#import <RCTBridgeModule.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapLocationKit/AMapLocationManager.h>

#import "DriveRoutePlanViewController.h"

@interface AMapSDK : RCTViewManager<RCTBridgeModule,AMapLocationManagerDelegate,MAMapViewDelegate>
{
  
}
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapSearchAPI *search;

@property(nonnull,strong)AMapNaviPoint *startPoint;
@property(nonnull,strong)AMapNaviPoint *endPoint;
@property(nonnull,strong)AMapNaviDriveManager *driveManager;

@property(nonnull,strong)AMapLocationManager *locationManager;


@end
