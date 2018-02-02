//
//  BJMainVC.m
//  BaisiBudeJieNew
//
//  Created by apple on 2018/1/29.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import "BJMainVC.h"
#import "BJNavigationVC.h"
#import "BJEssenceVC.h"
#import "BJNewVC.h"
#import "BJFriendTrendVC.h"
#import "BJMeVC.h"
#import "BJTabBar.h"
@interface BJMainVC ()

@end

@implementation BJMainVC

+(void)load{
    UITabBarItem * item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary * attrsSelected = [NSMutableDictionary dictionary];
    attrsSelected[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrsSelected forState:UIControlStateSelected];
    
    NSMutableDictionary * attrsNormal = [NSMutableDictionary dictionary];
    attrsNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [item setTitleTextAttributes:attrsNormal forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildVC];
    [self setupAllTitleButton];
    
    BJTabBar * tabbar = [[BJTabBar alloc]init];
    [self setValue:tabbar forKey:@"tabBar"];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];

}

//创建 所有控件试图
-(void)setupAllChildVC{
    BJNavigationVC * essenceVC = [[BJNavigationVC alloc]initWithRootViewController:[[BJEssenceVC alloc]init]];
     BJNavigationVC * newVC = [[BJNavigationVC alloc]initWithRootViewController:[[BJNewVC alloc]init]];
     BJNavigationVC * friendVC = [[BJNavigationVC alloc]initWithRootViewController:[[BJFriendTrendVC alloc]init]];
     BJNavigationVC * meVC = [[BJNavigationVC alloc]initWithRootViewController:[[BJMeVC alloc]init]];
    
    self.viewControllers = @[essenceVC,newVC,friendVC,meVC];
    
}

//设置所有的 tababr按钮
-(void)setupAllTitleButton{
    UINavigationController * nav = self.viewControllers[0];
    nav.tabBarItem.title = @"精华";
    nav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    UIImage * image = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    nav.tabBarItem.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController * nav1 = self.viewControllers[1];
    nav1.tabBarItem.title = @"新帖";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    UIImage * image1 = [UIImage imageNamed:@"tabBar_new_click_icon"];
    nav1.tabBarItem.selectedImage = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController * nav2 = self.viewControllers[2];
    nav2.tabBarItem.title = @"关注";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    UIImage * image2 = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    nav2.tabBarItem.selectedImage = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController * nav3 = self.viewControllers[3];
    nav3.tabBarItem.title = @"我";
    nav3.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    UIImage * image3 = [UIImage imageNamed:@"tabBar_me_click_icon"];
    nav3.tabBarItem.selectedImage = [image3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

@end
