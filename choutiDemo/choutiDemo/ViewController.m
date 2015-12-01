//
//  ViewController.m
//  choutiDemo
//
//  Created by 刘达浮云 on 15/11/9.
//  Copyright © 2015年 刘达浮云. All rights reserved.
//

#import "ViewController.h"
#import "leftView.h"



#define APP_HEIGHT [UIScreen mainScreen].bounds.size.height
#define APP_WIDTH [UIScreen mainScreen].bounds.size.width


@interface ViewController ()<leftViewDelegate>
{
    //抽屉view
    UIView *pushView;
    UIButton *rightBtn;
    UISwipeGestureRecognizer *leftRecognizer;
    UISwipeGestureRecognizer *rightRecognizer;
    UIView *drawerBackgroundView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *bg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
    bg.frame=CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT);
    [self.view addSubview:bg];
    
    //加入视图
    [self ChouTi];
}




#pragma - mark --ChouTi
//抽屉
-(void)ChouTi{
    //按钮
    UIImage* backImage = [UIImage imageNamed:@"cedaohang"];
    CGRect backframe = CGRectMake(30,30,50,50);//放的大方便看的见
    
    UIButton* backButton= [[UIButton alloc] initWithFrame:backframe];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(putView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    //加入window最上层
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:pushView];
    
    //装载抽屉的 左右 区域
    drawerBackgroundView = [[UIView alloc] init];
    drawerBackgroundView.frame = CGRectMake(-APP_WIDTH*0.6, 0, APP_WIDTH*0.6, APP_HEIGHT);
    [self.view addSubview:drawerBackgroundView];
    //如果无法放在最上层，把放在window上
    //[window addSubview:drawerBackgroundView];
    
    //左侧View
    pushView =[[UIView alloc]init];
    pushView.backgroundColor=[UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    pushView.frame=CGRectMake(-APP_WIDTH*0.6, 0, APP_WIDTH*0.6, APP_HEIGHT);
    [drawerBackgroundView addSubview:pushView];
    
    //把列表view加入左侧View
    leftView *left=[[leftView alloc]initWithFrame:CGRectMake(0, 0, pushView.bounds.size.width, pushView.bounds.size.height)];
    left.mainPopViewDelegate=self;
    left.loginBtnClickDelegate=self;
    [drawerBackgroundView addSubview:left];
    
    //右侧遮挡Button
    rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(APP_WIDTH*0.6, 0, self.view.bounds.size.width, APP_HEIGHT)];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [drawerBackgroundView addSubview:rightBtn];
    
    //左右滑手势，打开关闭抽屉
    leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    leftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    rightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [rightBtn addGestureRecognizer:leftRecognizer];
    [self.view addGestureRecognizer:rightRecognizer];
}

//按钮弹出抽屉
-(void)putView{
    NSLog(@"GO===========>>");
    [self openView];
    
}
//右侧热区
-(void)rightBtnClick:(UIButton *)sender
{
    NSLog(@"<<===========Back");
    [self closeView];
    
}
//手势开关抽屉
- (void)handlePanFrom:(UISwipeGestureRecognizer*)recognizer {
    // 触发手勢事件后，在这里作些事情
    if (recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Back==========Back");
        [self closeView];
    }else if (recognizer.direction==UISwipeGestureRecognizerDirectionRight){
        NSLog(@"Go==========Go");
        [self openView];
    }
}


//登录按钮/姓名按钮
-(void) loginBtnClick:(UIButton *) loginBtnClick{
    NSLog(@"UserName");
}

//列表按钮
-(void)mainTypeBtnClicks:(UIButton *)mainTypeBtn{
    NSInteger btnTag = mainTypeBtn.tag;
    
    if (btnTag == 10) {
        NSLog(@">>>>>>>>>>>>>>>>>= 1 =<<<<<<<<<<<<<<<");
      
    }else if (btnTag==11) {
        NSLog(@">>>>>>>>>>>>>>>>>= 2 =<<<<<<<<<<<<<<<");
      
    }else if (btnTag==12) {
        NSLog(@">>>>>>>>>>>>>>>>>= 3 =<<<<<<<<<<<<<<<");
       
    }else if (btnTag==13) {
        NSLog(@">>>>>>>>>>>>>>>>>= 4 =<<<<<<<<<<<<<<<");
        
    }else if (btnTag==14) {
        NSLog(@">>>>>>>>>>>>>>>>>= 5 =<<<<<<<<<<<<<<<");
        
    }
}



//打开动画
-(void)openView{
    
    [UIView animateWithDuration:0.3f animations:^{
    
        drawerBackgroundView.frame = CGRectMake(APP_WIDTH*0.0, 0, APP_WIDTH*1.0, APP_HEIGHT);
        drawerBackgroundView.hidden = NO;
        drawerBackgroundView.backgroundColor = [UIColor clearColor];
        
        pushView.frame=CGRectMake(0, 0, APP_WIDTH*0.6, APP_HEIGHT);
        pushView.backgroundColor=[UIColor colorWithRed:255 green:255 blue:255 alpha:1];
        
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        rightBtn.frame=CGRectMake(APP_WIDTH*0.6, 0, APP_WIDTH*0.4, APP_HEIGHT);
        rightBtn.hidden = NO;
        rightBtn.backgroundColor = [UIColor blackColor];
        rightBtn.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.0f animations:^{
            
        } completion:^(BOOL finished) {
            
        }];
    }];
}
//关闭动画
-(void)closeView{
    [UIView animateWithDuration:0.3f animations:^{
        
        pushView.frame=CGRectMake(-APP_WIDTH*0.6, 0, APP_WIDTH*0.6, APP_HEIGHT);
        drawerBackgroundView.frame = CGRectMake(-APP_WIDTH*0.6, 0, APP_WIDTH*0.6, APP_HEIGHT);
        drawerBackgroundView.hidden = NO;
        rightBtn.frame=CGRectMake(APP_WIDTH*0.6, 0, self.view.bounds.size.width, APP_HEIGHT);
        rightBtn.alpha = 0;
        
    } completion:^(BOOL finished) {
        
    }];
}
#pragma - mark --ChouTi End


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
