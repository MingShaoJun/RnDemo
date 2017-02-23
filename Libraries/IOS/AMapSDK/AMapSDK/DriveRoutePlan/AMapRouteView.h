//
//  aMapRouteView.h
//  AMapSDK
//
//  Created by 黄海明 on 2017/2/22.
//  Copyright © 2017年 HAL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMapRouteView : UIView


@property (nonatomic, assign) BOOL isControl;
@property (nonatomic, strong) NSDictionary *infoDict;
@property (nonatomic, strong) NSString  *startPointLong;
@property (nonatomic, strong) NSDictionary *aMapRouteLoad;

-(void)routePlanActionMultiple:(BOOL)isMultiple;
-(void)onChoice:(NSInteger)tag;
-(void)routePlanActionMultipddDatex:(float)x datexy:(float)y width:(float)width height:(float)height;


///
- (NSInteger)test4;
@end
