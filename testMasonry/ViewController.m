//
//  ViewController.m
//  testMasonry
//
//  Created by tanzhen on 16/7/6.
//  Copyright © 2016年 CoderTz. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "ShareView.h"
#import "UIView+TYAlertView.h"
// if you want blur efffect contain this
#import "TYAlertController+BlurEffects.h"
#import "TwoViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    
    self.view.backgroundColor = [UIColor grayColor];
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"um_edit_nomal"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"um_edit_highlight"] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(ClickEditBtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(self.view.mas_left).with.offset(100);
        make.top.equalTo(self.view.mas_centerY).with.offset(100);
    }];
    
    
    
   [self CreatView];
    
}
- (void)CreatView
{
    __weak typeof (self) weakSelf = self;
    
//    UIView * maskView = [[UIView alloc] init];
//
//    maskView.backgroundColor = [UIColor orangeColor];
//    //    maskView.frame = CGRectMake(40, 100, 200, 100);
//    [self.view addSubview:maskView];
//    // 做约束   这是写死居中的
//    //    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
//    //
//    //        make.center.equalTo(weakSelf.view);
//    //
//    //        make.size.mas_equalTo(CGSizeMake(200, 200));
//    //
//    //
//    //    }];
//    //不固定宽高 距离父视图。。。
//    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(weakSelf.view);
//        make.edges.mas_offset(UIEdgeInsetsMake(74, 10, 300, 10));
//        
//    }];
    UIView * view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.centerX.equalTo(weakSelf.view);
        make.centerY.equalTo(weakSelf.view);
    }];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"um_edit_nomal"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"um_edit_highlight"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(ClickEditBtn) forControlEvents:UIControlEventTouchDown];
    [view1 addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.centerX.equalTo (view1);
        make.centerY.equalTo(view1);
    }];
}

- (void)ClickEditBtn2
{
    TwoViewController * TWOvC = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:TWOvC animated:YES];
 
}
- (void)ClickEditBtn
{
    ShareView *shareV = [ShareView createViewFromNib];
    CALayer * layer = [shareV layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:8.0f];
    [layer setBorderWidth:1.0f];
    layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:237 green:237 blue:237 alpha:0.5]);
   [shareV showInWindow];
    [shareV mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
        make.height.mas_equalTo(@187);
        make.center.equalTo(self.view.mas_centerY);
    }];
    [shareV.downAlbums mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shareV.mas_top).with.offset(10);
        make.height.mas_equalTo(@40);
        make.centerX.equalTo(shareV.mas_centerX);
    }];
    CGFloat TzScroW = self.view.frame.size.width;
    // 间距
    CGFloat Paging = (TzScroW-260)/5;
    
    [shareV.WeChat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 66));
        make.left.equalTo(shareV.mas_left).with.offset(Paging);
        make.top.equalTo(shareV).with.offset(60);
    
    }];
    
    [shareV.QQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 66));
        make.left.equalTo(shareV.WeChat.mas_right).with.offset(Paging);
        make.top.equalTo(shareV).with.offset(60);
    
    
    }];
    [shareV.qqZone mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.size.mas_equalTo(CGSizeMake(50, 66));
        make.left.equalTo(shareV.QQ.mas_right).with.offset(Paging);
        make.top.equalTo(shareV).with.offset(60);
    
    
    }];
    [shareV.FrendsCircle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 66));
        make.left.equalTo(shareV.qqZone.mas_right).with.offset(Paging);
        make.top.equalTo(shareV).with.offset(60);
    
    
    }];
    [shareV.Cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@30);
        make.left.equalTo(shareV).with.offset(0);
        make.right.equalTo(shareV).with.offset(0);
        make.bottom.equalTo(shareV.mas_centerY).with.offset(90);
        //        make.bottom.equalTo(shareV.mas_bottom).with.offset(30);
        
    }];
    
  
}



























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
