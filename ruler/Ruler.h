//
//  Ruler.h
//  ruler
//
//  Created by li shuai on 12-10-31.
//  Copyright (c) 2012年 li shuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ruler : UIView
{
    CGFloat beganX;
    CGFloat moveX;
    CGFloat endX;
}

@property (nonatomic, strong) UIColor *color;
@property CGFloat rulingSpan;
@property CGFloat value;

@end
