//
//  TwoViewController.m
//  testMasonry
//
//  Created by tanzhen on 16/7/19.
//  Copyright © 2016年 CoderTz. All rights reserved.
//

#import "TwoViewController.h"
#import "Masonry.h"
@interface TwoViewController ()

@property(nonatomic,strong)UIButton *IconBtn;
@property(nonatomic,strong)UIButton *tagBtn;
@property(nonatomic,strong)UIButton *sendBtn;
@property(nonatomic,strong)UILabel *tipLabel;
@property(nonatomic,strong)UILabel *ChooseTagLabel;
@property(nonatomic,strong)UILabel *psLabel;
@property(nonatomic,strong)UITextField *textFName;
@property(nonatomic,strong)UITextField *TagFContent;
@property(nonatomic,strong)UIImageView *editImg;
@property(nonatomic,strong)UIImageView *lineView;


@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatUI];
    [self setframe];
}

- (void)CreatUI
{
  // 这里先创建 所有的 控件
    UIButton * IconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [IconBtn setImage:[UIImage imageNamed:@"QQfs"] forState:UIControlStateNormal];
    IconBtn.layer.masksToBounds = YES;
    IconBtn.layer.cornerRadius = IconBtn.frame.size.height/2;
    self.IconBtn = IconBtn;
    [self.view addSubview:IconBtn];
#pragma mark---
    UILabel * tipLabel = [[UILabel alloc] init];
    tipLabel.text = @"上传社团头像";
    tipLabel.font = [UIFont systemFontOfSize:15];
    tipLabel.textColor = [UIColor grayColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel = tipLabel;
    [self.view addSubview:tipLabel];
#pragma mark----
    UIImageView * editImg = [[UIImageView alloc] init];
    [editImg setImage:[UIImage imageNamed:@"um_edit_nomal"]];
    self.editImg = editImg;
    [self.view addSubview:editImg];
#pragma mark---
    UITextField * textFName = [[UITextField alloc] init];
    textFName.placeholder = @"请填写社区名(社区名最多6个字)";
    textFName.font = [UIFont systemFontOfSize:17];
    self.textFName = textFName;
    [self.view addSubview:textFName];
#pragma mark---
    UIImageView * lineView = [[UIImageView alloc] init];
    [lineView setBackgroundColor:[UIColor redColor]];
    self.lineView = lineView;
    [self.view addSubview:lineView];
#pragma mark---
    UILabel * ChooseTagLabel = [[UILabel alloc] init];
    ChooseTagLabel.text = @"选择标签";
    ChooseTagLabel.font = [UIFont systemFontOfSize:15];
    ChooseTagLabel.textColor = [UIColor grayColor];
    self.ChooseTagLabel = ChooseTagLabel;
    [self.view addSubview:ChooseTagLabel];
#pragma mark---
    UITextField * TagFContent = [[UITextField alloc] init];
    TagFContent.placeholder = @"美容颜";
    TagFContent.font = [UIFont systemFontOfSize:16];
    TagFContent.textColor = [UIColor grayColor];
    TagFContent.borderStyle=UITextBorderStyleRoundedRect;
    self.TagFContent = TagFContent;
    [self.view addSubview:TagFContent];
#pragma mark--- 标签内容
    CGFloat W = 0;
    CGFloat H = 355;
    
    NSArray * dataArry = @[@"美容颜",@"多拉爱梦",@"joke",@"cosplayjoy",@"美容Yankee",@"肉肉帮",@"化妆控",@"cosplay"];
    
    
    for (int i = 0; i<dataArry.count; i++) {
      UIButton  * tagBtn = [UIButton  buttonWithType:UIButtonTypeSystem];
        tagBtn.tag = 100 + i;
        [tagBtn setBackgroundColor:[UIColor grayColor]];
        [tagBtn addTarget:self action:@selector(ClickTagBtn) forControlEvents:UIControlEventTouchUpInside];
        tagBtn.layer.cornerRadius = 4.0;
        tagBtn.layer.masksToBounds = YES;
        [tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 根据文字 来计算大小
        NSDictionary * dicText = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGFloat length = [dataArry[i]boundingRectWithSize:CGSizeMake(320, 10000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dicText context:nil].size.width;
        // 赋值给btn
        [tagBtn setTitle:dataArry[i] forState:UIControlStateNormal];
        tagBtn.frame = CGRectMake(10 + W, H, length + 10, 30);
        if (10 + W + length + 10 > self.view.frame.size.width) {
            // 换行啊
            W = 0;
            H = H +30 + 10;
            
            tagBtn.frame = CGRectMake(10 +W, H, length + 15, 30);
            
        }
        
        
        W = tagBtn.frame.size.width + tagBtn.frame.origin.x;
        self.tagBtn = tagBtn;
        [self.view addSubview:tagBtn];
        
    }
#pragma mark--- ps
    UILabel * psLabel = [[UILabel alloc] init];
    psLabel.text = @"PS:成员和视频越多的社团月容易被发现哦!";
    psLabel.textColor = [UIColor redColor];
    psLabel.font = [UIFont systemFontOfSize:14];
    self.psLabel = psLabel;
    [self.view addSubview:psLabel];
#pragma mark--- 确认按钮
    UIButton * sendBtn = [[UIButton alloc ]init];
     [sendBtn setTitle:@"确认发布" forState:UIControlStateNormal];
     [sendBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
     [sendBtn setBackgroundColor:[UIColor redColor]];
     [sendBtn.layer setCornerRadius:5];
     [sendBtn.layer setBorderWidth:1];
     [sendBtn.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor redColor])];
     [sendBtn setFont:[UIFont systemFontOfSize:14]];
     self.sendBtn = sendBtn;
     [self.view addSubview:sendBtn];
}

- (void)setframe
{
    __weak typeof(self)weakself = self;
    [self.IconBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 90));
        make.centerX.equalTo(weakself.view);
        make.top.with.offset(90);
    }];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.IconBtn);
        
        make.top.equalTo(self.IconBtn.mas_bottom).with.offset(20);
        
    }];
    [self.editImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 30));
        make.left.equalTo(weakself.view).with.offset(10);
        make.top.equalTo(self.tipLabel.mas_bottom).with.offset(30);
        
    }];
    [self.textFName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@20);
        make.centerY.equalTo(self.editImg);
        make.right.equalTo(weakself.view).with.offset(-10);
        make.left.equalTo(self.editImg.mas_right).with.offset(5);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(@1);
        make.left.equalTo(weakself.view).with.offset(10);
        make.right.equalTo(weakself.view).with.offset(-10);
        make.top.equalTo(self.editImg.mas_bottom).with.offset(5);
   
    }];
    [self.ChooseTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@20);
        make.width.mas_equalTo(@60);
        make.left.equalTo(weakself.view).with.offset(10);
        make.top.equalTo(self.lineView).with.offset(35);
    }];
    [self.TagFContent  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.ChooseTagLabel);
        make.right.equalTo(self.view).with.offset(-10);
        make.left.equalTo(self.ChooseTagLabel.mas_right).with.offset(5);
    }];
    [self.psLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
         make.left.equalTo(self.view).with.offset(10);
         make.right.equalTo(self.view).with.offset(-10);
        make.top.equalTo(self.tagBtn.mas_bottom).with.offset(20);
       
        
      }];
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@30);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.top.equalTo(self.psLabel.mas_bottom).with.offset(40);
        
        
        
        
    }];
    
}
- (void)ClickTagBtn
{
    
    NSLog(@"啥都没有");
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
