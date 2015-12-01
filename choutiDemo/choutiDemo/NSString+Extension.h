//
//  NSString+Extension.h
//
//
//  Created by on 14/12/16.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGRect)textRectWithSize:(CGSize)textSize attributes:(NSDictionary *) attributes;

@end
