//
//  NSString+Extension.m
//  
//
//  Created by  on 14/12/16.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    
    
}

-(CGRect)textRectWithSize:(CGSize)textSize attributes:(NSDictionary *) attributes{
    return [self boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
}


@end
