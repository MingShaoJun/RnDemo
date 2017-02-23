//
//  DriveRoutePlanViewController.h
//  AMapNaviKit
//
//  Created by liubo on 7/29/16.
//  Copyright © 2016 AutoNavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapNaviKit/AMapNaviKit.h>
#import "kkk.h"

@interface DriveRoutePlanViewController : UIViewController

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapNaviDriveManager *driveManager;

-(void)routePlanActionMultipddDatex:(float)x datexy:(float)y width:(float)width height:(float)height;


/**
 RN 通用接口
 */

//是否显示控制View
@property (nonatomic, assign) BOOL isControl;
@property (nonatomic, strong) NSDictionary *infoDict;
@property (nonatomic, strong) NSString  *startPointLong;
@property (nonatomic, strong) NSDictionary *aMapRouteLoad;
/**
 RN 通用调用事件
 */
-(void)routePlanActionMultiple:(BOOL)isMultiple;
-(void)onChoice:(NSInteger)tag;


@end
