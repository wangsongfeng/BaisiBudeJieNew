//
//  BJNavigationVC.m
//  BaisiBudeJieNew
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import "BJNavigationVC.h"

@interface BJNavigationVC ()

@end

@implementation BJNavigationVC
+(void)load{
    UINavigationBar * navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:attrs];
    
    //根据颜色 生成图片 利用 Quart2D
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [NavTinColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    NSMutableDictionary * itemDic = [NSMutableDictionary dictionary];
    itemDic[NSForegroundColorAttributeName] =[UIColor blackColor];
    itemDic[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:itemDic forState:UIControlStateNormal];
    
    NSMutableDictionary * itemDisable = [NSMutableDictionary dictionary];
    itemDisable[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:itemDisable forState:UIControlStateDisabled];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"]       ;
    }
}

-(void)back{
    [self popViewControllerAnimated:YES];
}

@end
