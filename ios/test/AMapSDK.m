//
//  AMapSDK.m
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/17.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "AMapSDK.h"
#import "AMapView.h"
#import "AppDelegate.h"

//121.470137,31.25779 上海
//110.08221,20.963396 雷州
// 110.910089,21.704622 茂名

@implementation AMapSDK
RCT_EXPORT_MODULE()
@synthesize bridge = _bridge;

- (UIView *)view
{
  self.mapView = [[MAMapView alloc] init];
  self.mapView.delegate = self;
  
  CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(21.704622,110.910089);

  [_mapView setCenterCoordinate:coordinate animated:NO];

  
  MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
  pointAnnotation.coordinate = coordinate;
  pointAnnotation.title = @"茂名";
  pointAnnotation.subtitle = @"这是在茂名";
  
  [_mapView addAnnotation:pointAnnotation];
  
  [self.mapView setZoomLevel:8 animated:NO];

  return self.mapView;
}


RCT_EXPORT_METHOD(addEventdddddd:(NSString *)URL)
{
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
//  NSLog(@"%@",_mapView.kMAMapLayerCenterMapPointKey);
  
  if (self.locationManager == nil) {
    self.locationManager = [[AMapLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    [self.locationManager setAllowsBackgroundLocationUpdates:YES];

  }
  [self.locationManager startUpdatingLocation];
  
}


RCT_REMAP_METHOD(findEventsName,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  resolve(@"哈哈");
  

  
}

RCT_REMAP_METHOD(navigation,longitude:(double)longitude latitude:(double)latitude)
{
  
      dispatch_async(dispatch_get_main_queue(), ^{

  DriveRoutePlanViewController *subViewController = [[DriveRoutePlanViewController alloc] init];
  
  subViewController.title = @"导航";

  UIViewController *rootView=[[[UIApplication sharedApplication]keyWindow]rootViewController];

  [rootView presentViewController:subViewController animated:YES completion:^{
    
  }];
      });
}
/* 实现代理方法：*/
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
  if ([annotation isKindOfClass:[MAPointAnnotation class]])
  {
    static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
    MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
    if (annotationView == nil)
    {
      annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation                                                 reuseIdentifier:pointReuseIndetifier];
    }
    annotationView.canShowCallout = YES;
    annotationView.animatesDrop = YES;
    annotationView.draggable = YES;
    annotationView.rightCalloutAccessoryView  = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//    annotationView.pinColor  = [self.annotations indexOfObject:annotation] % 3;
    return annotationView;
  }
  return nil;
}

- (void)mapView:(MAMapView *)mapView didSingleTappedAtCoordinate:(CLLocationCoordinate2D)coordinate;
{
  
}
#pragma mark -定位 



- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
  //定位错误
  NSLog(@"%s, amapLocationManager = %@, error = %@", __func__, [manager class], error);
  [self.locationManager stopUpdatingLocation];

}

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
  //定位结果
  NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
  

  
  dispatch_async(dispatch_get_main_queue(), ^{

  
  [self.bridge.eventDispatcher sendDeviceEventWithName:@"onLocationData" body:@"23456789"];
    

  });
  [self.locationManager stopUpdatingLocation];


}


@end
