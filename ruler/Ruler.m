//
//  Ruler.m
//  ruler
//
//  Created by li shuai on 12-10-31.
//  Copyright (c) 2012年 li shuai. All rights reserved.
//

#import "Ruler.h"

@implementation Ruler

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = [UIColor blackColor];
        self.rulingSpan = 5.0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    CGContextFillPath(context);
    
    int c = 0;
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    for (CGFloat i = - self.value * self.rulingSpan; i < self.frame.size.width; i += self.rulingSpan) {
        CGContextMoveToPoint(context, i, 0);
        if (!(c % 10)) {
            CGContextAddLineToPoint(context, i, 15);
            
            CGPoint point = CGPointMake(i, 16.0);
            NSString *label = [NSString stringWithFormat:@"%.0f", i * self.rulingSpan + self.value];
            [label drawAtPoint:point forWidth:20.0 withFont:[UIFont systemFontOfSize:12] lineBreakMode:NSLineBreakByCharWrapping];
        } else if (!(c % 5)) {
            CGContextAddLineToPoint(context, i, 10);
        } else {
            CGContextAddLineToPoint(context, i, 5);
        }
        c++;
    }
    CGContextStrokePath(context);
    CGContextFillPath(context);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    beganX = point.x;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    moveX = point.x;
    self.value = - (endX + moveX - beganX) / self.rulingSpan;
    [self setNeedsDisplay];
    NSLog(@"%f", self.value);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    endX += moveX - beganX;
}

@end
