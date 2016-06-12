//
//  HDTwoLinesView.m
//  profile
//
//  Created by Apple on 16/6/9.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "HDTwoLinesView.h"

@implementation HDTwoLinesView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGFloat width = self.frame.size.width;
    CGFloat heigh = self.frame.size.height;
    
    NSLog(@"*%f %f", width, heigh);
    
    CGPoint point1 = CGPointMake(width * 24 / 77, 5);
    CGPoint point2 = CGPointMake(width * 24 / 77, heigh - 5);
    CGPoint point3 = CGPointMake(width * 53 / 77, 5);
    CGPoint point4 = CGPointMake(width * 53 / 77, heigh - 5);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineCap(ctx, kCGLineCapSquare);
    CGContextSetLineWidth(ctx, 0.6);
    CGContextSetRGBStrokeColor(ctx, 151.0/255, 151.0/255, 155.0/255, 1.0);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, point1.x, point1.y);
    CGContextAddLineToPoint(ctx, point2.x, point2.y);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, point3.x, point3.y);
    CGContextAddLineToPoint(ctx, point4.x, point4.y);
    CGContextStrokePath(ctx);
}

@end
