//
//  leftView.m
//  choutiDemo
//
//  Created by 刘达浮云 on 15/11/9.
//  Copyright © 2015年 刘达浮云. All rights reserved.
//

#import "leftView.h"
#import "NSString+Extension.h"

@interface leftView ()

@property (nonatomic ,strong) UIButton *mainTypeBtn;
@property (nonatomic ,strong) UIButton *loginBtn;
@property (nonatomic ,strong) UIImageView *userImg;


@end


@implementation leftView

/**
 * 代码添加控件时，init内部会调用此方法，在此初始化控件
 */
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self leftTableView];
    }
    return self;
}

/**
 * xib/storyboard添加控件时，init内部会调用此方法，在此初始化控件
 */
-(id)initWithCoder:(NSCoder *)decoder{
    self = [super initWithCoder:decoder];
    if (self) {
        [self leftTableView];
    }
    return self;
}

-(void)leftTableView{
    NSArray *btnTitleNameArray = [NSArray arrayWithObjects:@"   个人信息",@"   企业认证",@"   我的名片",@"   我的消息",@"   我的设置", nil];
    NSArray *btnImageNameArray = [NSArray arrayWithObjects:@"gerenxingxi",@"quyerenzheng",@"wodemingpian",@"wode-xiaoxi",@"wode-shezhi-0", nil];
    
    self.btnTitleNameArray = btnTitleNameArray;
    self.btnImageNameArray = btnImageNameArray;
    
    
    for (int i = 0; i < self.btnTitleNameArray.count; i ++) {
        UIButton *mainTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mainTypeBtn = mainTypeBtn;
        self.mainTypeBtn.titleLabel.font=[UIFont systemFontOfSize:16];
        self.mainTypeBtn.titleLabel.textColor=[UIColor whiteColor];
        [mainTypeBtn setTitle:self.btnTitleNameArray[i] forState:UIControlStateNormal];
        [mainTypeBtn setImage:[UIImage imageNamed:self.btnImageNameArray[i]] forState:UIControlStateNormal];
        mainTypeBtn.tag = 10 + i;
        [mainTypeBtn addTarget:self action:@selector(mainTypeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mainTypeBtn];
    }
    
    UIImageView *userImg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tuoyuanxing"]];
    self.userImg = userImg;
    [self addSubview:userImg];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn = loginBtn;
    
    self.loginBtn.titleLabel.font=[UIFont systemFontOfSize:18];
    self.loginBtn.titleLabel.textColor=[UIColor whiteColor];
    self.loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    
    if (1+1==(2)) {
        [loginBtn setTitle:@"什么鬼" forState:UIControlStateNormal];
    }else{
        [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self addSubview:loginBtn];


}

-(void) mainTypeBtnClick:(UIButton *) mainTypeBtn{
    
    if (self.mainPopViewDelegate) {
        [self.mainPopViewDelegate mainTypeBtnClicks:mainTypeBtn];
    }
}

-(void) loginBtnClick:(UIButton *) loginBtnClick{
    
    if (self.mainPopViewDelegate) {
        [self.mainPopViewDelegate mainTypeBtnClicks:loginBtnClick];
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor=[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    
    NSInteger counts = self.subviews.count;
    CGFloat btnY = 0;
    CGSize btnS = [self.mainTypeBtn.currentTitle sizeWithFont:self.mainTypeBtn.titleLabel.font maxSize:CGSizeMake(self.frame.size.width, 60)];// btn实际高度（根据文字计算出的）
    CGFloat btnH = btnS.height+5;// 按钮高
    CGFloat btnR = btnH*1.5; // 按钮间距
    
    for (int i = 0; i < counts ; i ++) {
        UIButton *btn = self.subviews[i];
        btnY = (btnH + btnR) * i + (20+47+27+9+52);
        btn.frame = CGRectMake(32, btnY, btnS.width+23+15, btnH);
        
    }
    
    self.userImg.frame=CGRectMake(20, 20+47, 55, 55);
    
    self.loginBtn.frame=CGRectMake(20+55+5, 20+47+15, [UIScreen mainScreen].bounds.size.width*0.6-(20+55+5)-10, 20);
}




@end
