//
//  leftView.h
//  choutiDemo
//
//  Created by 刘达浮云 on 15/11/9.
//  Copyright © 2015年 刘达浮云. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol leftViewDelegate <NSObject>

-(void) mainTypeBtnClicks:(UIButton *) mainTypeBtn;
-(void) loginBtnClick:(UIButton *) loginBtnClick;
@end


@interface leftView : UIView

@property (nonatomic, strong) NSArray *btnTitleNameArray;
@property (nonatomic, strong) NSArray *btnImageNameArray;

@property (nonatomic, assign) id<leftViewDelegate> mainPopViewDelegate;

@end
