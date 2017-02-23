//
//  AMapView.h
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/17.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import "RCTViewManager.h"
#import <RCTBridgeModule.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import <AMapLocationKit/AMapLocationManager.h>

#import "DriveRoutePlanViewController.h"

@protocol aMapDelegate <NSObject>

-(void)aMapDelegateCode:(NSString *)code data:(NSDictionary *)dic;

@end

@interface AMapView : UIView<AMapLocationManagerDelegate,MAMapViewDelegate>
{
    
}
+sharedInstance;
-(void)positionAction;
-(void)navigation:(NSDictionary *)dic;

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapSearchAPI *search;

@property(nonnull,strong)AMapNaviPoint *startPoint;
@property(nonnull,strong)AMapNaviPoint *endPoint;
@property(nonnull,strong)AMapNaviDriveManager *driveManager;

@property(nonnull,strong)AMapLocationManager *locationManager;
@property(nonnull,strong)id<aMapDelegate> delegate;


@end
