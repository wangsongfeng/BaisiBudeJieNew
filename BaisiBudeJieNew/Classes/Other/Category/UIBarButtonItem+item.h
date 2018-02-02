//
//  UIBarButtonItem+item.h
//  BaisiBudeJieNew
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)
+ (UIBarButtonItem *)backItemWithimage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action title:(NSString *)title;
@end
