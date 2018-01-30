//
//  BJPushGuideView.m
//  BaisiBudeJieNew
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import "BJPushGuideView.h"

@implementation BJPushGuideView

+ (void)show{
    NSString *key = @"CFBundleShortVersionString";
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    // 获得沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sanboxVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        BJPushGuideView *guideView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
        guideView.frame = window.bounds;
        [window addSubview:guideView];
        
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (IBAction)close:(id)sender {
    [self removeFromSuperview];
}
@end
