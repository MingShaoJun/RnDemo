//
//  RnWebImage.m
//  RnWebImage
//
//  Created by 黄海明 on 2017/2/15.
//  Copyright © 2017年 XRK. All rights reserved.
//

#import "RnWebImage.h"

@implementation RnWebImage



RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(addEvent:(NSString *)URL)
{
    
//    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"
//                         
//                                                  message:@"这是一个简单的警告框！"
//                         
//                                                 delegate:nil
//                         
//                                        cancelButtonTitle:@"确定"
//                         
//                                        otherButtonTitles:nil];
//    
//    [alert show];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"ddddd",@"name", nil];
    [self isPosition:dic];
    
}




- (NSArray<NSString *> *)supportedEvents
{
    return @[@"isPosition", @"iseVolume", @"playCallback"];//有几个就写几个
}

-(void)iseCallback:(NSString*)code result:(NSString*) result
{
    //    [self sendEventWithName:@"isPosition"
    //                       body:@{
    //                              @"code": code,
    //                              @"result": result,
    //                              }];
}
-(void)isPosition:(NSDictionary *)dic{
    [self sendEventWithName:@"isPosition"
                       body:dic];
}


- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

@end
