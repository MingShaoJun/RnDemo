//
//  PreferenceView.h
//  AMapNaviKit
//
//  Created by liubo on 6/27/16.
//  Copyright © 2016 AutoNavi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapNaviKit/AMapNaviKit.h>

@protocol preferDelegate <NSObject>

-(void)isSingleRoute:(BOOL)route;

@end

@interface PreferenceView : UIView

//根据路径偏好状态获取路径计算策略
- (AMapNaviDrivingStrategy)strategyWithIsMultiple:(BOOL)isMultiple;
-(void)onChoice:(NSInteger)tag;


@property(nonnull,strong)id<preferDelegate>delegate;
@end
