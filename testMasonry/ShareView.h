//
//  ShareView.h
//  TYAlertControllerDemo
//
//  Created by tanyang on 15/10/26.
//  Copyright © 2015年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareView : UIView

// 依次排列 微信 qq QQ空间 朋友圈 取消

@property (weak, nonatomic) IBOutlet UIButton *WeChat;
@property (weak, nonatomic) IBOutlet UIButton *QQ;


@property (weak, nonatomic) IBOutlet UIButton *qqZone;

@property (weak, nonatomic) IBOutlet UIButton *FrendsCircle;


@property (weak, nonatomic) IBOutlet UIButton *Cancel;

@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (weak, nonatomic) IBOutlet UIImageView *downAlbums;

- (IBAction)ClickCancelBtn:(id)sender;


@end
