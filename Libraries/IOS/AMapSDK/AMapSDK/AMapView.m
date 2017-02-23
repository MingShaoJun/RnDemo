//
//  AMapView.m
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/17.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import "AMapView.h"
#import <MAMapKit/MAMapKit.h>

@implementation AMapView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
static AMapView *aMapView;

+sharedInstance{
    @synchronized (self) {
        if (!aMapView) {
            aMapView=[[AMapView alloc]init];
        }
    }
    return aMapView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (void)layoutSubviews {
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    [AMapServices sharedServices].apiKey = @"683162b8eb021de50d56fffe9639c182";
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.mapView.delegate = self;
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(21.704622,110.910089);
    
    [_mapView setCenterCoordinate:coordinate animated:NO];
    
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = coordinate;
    pointAnnotation.title = @"茂名";
    pointAnnotation.subtitle = @"这是在茂名";
    
    [_mapView addAnnotation:pointAnnotation];
    
    [self.mapView setZoomLevel:8 animated:NO];
    
//    return self.mapView;
    self.backgroundColor=[UIColor blueColor];
    [self addSubview:self.mapView];

}
//dispatch_async(dispatch_get_main_queue(), ^{

#pragma mark - 定位
-(void)positionAction{
       
        self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    //  NSLog(@"%@",_mapView.kMAMapLayerCenterMapPointKey);
    if (self.locationManager == nil) {
        self.locationManager = [[AMapLocationManager alloc] init];
        [self.locationManager setDelegate:self];
        
        [self.locationManager setPausesLocationUpdatesAutomatically:NO];
        
        [self.locationManager setAllowsBackgroundLocationUpdates:YES];
        
    }
    [self.locationManager startUpdatingLocation];

}
#pragma mark - 导航
-(void)navigation:(NSDictionary *)dic{
    DriveRoutePlanViewController *subViewController = [[DriveRoutePlanViewController alloc] init];
    
    subViewController.title = @"导航";
    subViewController.isControl=YES;
    subViewController.aMapRouteLoad=dic;
    UIViewController *rootView=[[[UIApplication sharedApplication]keyWindow]rootViewController];
    
    [rootView presentViewController:subViewController animated:YES completion:^{
        
    }];
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
#pragma mark -定位代理
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
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:location.coordinate.longitude],@"longitude",[NSNumber numberWithFloat:location.coordinate.latitude],
                       @"latitude",
                       [NSNumber numberWithFloat:location.horizontalAccuracy],@"accuracy", nil];
    [self.locationManager stopUpdatingLocation];
    [self.delegate aMapDelegateCode:@"isPosition" data:dic];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

@end
