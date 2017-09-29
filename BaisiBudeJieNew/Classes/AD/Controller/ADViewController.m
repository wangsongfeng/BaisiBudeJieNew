//
//  ADViewController.m
//  BaisiBudeJieNew
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "ADViewController.h"
#import "ADModel.h"
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
@interface ADViewController ()
@property(nonatomic,strong)UIImageView * launchImage;
@property(nonatomic,strong)DALabeledCircularProgressView * progressView;
@property(nonatomic,strong)UIView*adView;
@property(nonatomic,strong)UIImageView * adImageView;
@property(nonatomic,strong)ADModel * model;
@end

@implementation ADViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setLaunchImage];
    [self loadAdData];
    
    self.progressView.hidden=NO;


}
-(void)setLaunchImage{
    if (iphone6P) {
        self.launchImage.image=[UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if (iphone6){
        self.launchImage.image=[UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if (iphone5){
        self.launchImage.image=[UIImage imageNamed:@"LaunchImage-568h"];
    }else if (iphone4){
        self.launchImage.image=[UIImage imageNamed:@"LaunchImage-700"];
    }
}
#pragma mark launch 图片
-(UIImageView*)launchImage{
    if (_launchImage==nil) {
        _launchImage=[[UIImageView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_launchImage];
    }
    return _launchImage;
}

#pragma mark 进度条
-(DALabeledCircularProgressView*)progressView{
    if (_progressView==nil) {
        _progressView=[[DALabeledCircularProgressView alloc]init];
        _progressView.roundedCorners=YES;
        _progressView.progressLabel.textColor=[UIColor redColor];
        _progressView.trackTintColor=[UIColor redColor];
        _progressView.progressTintColor=[UIColor lightGrayColor];
        _progressView.hidden=YES;
        _progressView.progressLabel.text=@"";
        _progressView.thicknessRatio=0.1;
        [_progressView setProgress:0 animated:YES];
        [self.view addSubview:_progressView];
        _progressView.frame=CGRectMake(ScreenW-70, 20, 50, 50);
    }
    return _progressView;
}
-(UIView*)adView{
    if (_adView==nil) {
        _adView=[[UIView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_adView];
    }
    return _adView;
}
#pragma mark 广告图
-(UIImageView*)adImageView{
    if (_adImageView==nil) {
        _adImageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [_adImageView addGestureRecognizer:tap];
        _adImageView.userInteractionEnabled = YES;

        [self.adView addSubview:_adImageView];
    }
    return _adImageView;
}
-(void)tap{
    
}

- (void)loadAdData{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    NSMutableSet *newSet = [NSMutableSet set];
    newSet.set = mgr.responseSerializer.acceptableContentTypes;
    [newSet addObject:@"text/html"];
    mgr.responseSerializer.acceptableContentTypes = newSet;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        _model = [ADModel mj_objectWithKeyValues:adDict];
        CGFloat h = ScreenW / _model.w * _model.h;
        if (h>0) {
            //self.adView.frame = CGRectMake(0, 0, ScreenW, h);
//            self.adView.frame = CGRectMake(0, 0, ScreenW, ScreenH);
//            self.adView.contentMode = UIViewContentModeScaleToFill;
            [self.adImageView sd_setImageWithURL:[NSURL URLWithString:_model.w_picurl]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

@end
