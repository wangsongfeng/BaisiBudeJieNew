//
//  BJTabBar.m
//  BaisiBudeJieNew
//
//  Created by apple on 2018/2/3.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import "BJTabBar.h"

@interface BJTabBar()

@property(nonatomic,strong)UIButton * publishBtn;
@property(nonatomic,strong)UIControl * previousClickTababrBtn;

@end
@implementation BJTabBar
-(UIButton*)publishBtn{
    if (_publishBtn==nil) {
        _publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [_publishBtn sizeToFit];
        [_publishBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_publishBtn];
        
    }
    
    return _publishBtn;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat btnW = self.width / (self.items.count + 1);
    CGFloat btnH = self.height;
    CGFloat x = 0;
    int i = 0;
    for (UIControl * tabbarBtn in self.subviews) {
        if ([tabbarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i== 0 && _previousClickTababrBtn==nil) {
                _previousClickTababrBtn = tabbarBtn;
            }
            
            if (i==2) {
                i+=1;
            }
            x = i * btnW;
            
            tabbarBtn.frame = CGRectMake(x, 0, btnW, btnH);
            i++;
            [tabbarBtn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    self.publishBtn.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

-(void)publishBtnClick{
    
}

-(void)tabBarButtonClick:(UIControl*)control{
    
}
@end
