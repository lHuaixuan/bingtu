
//
//  PieView.m
//  饼图
//
//  Created by admin on 16/7/27.
//  Copyright © 2016年 刘怀轩. All rights reserved.
//

#import "PieView.h"

@implementation PieView

// 随机数组
- (NSArray *)arrRandom {
    int total = 100;
    NSMutableArray *arrM = [NSMutableArray array];
    int temp = 0;
    for (int i = 0; i < 3; i++) {
        temp = arc4random_uniform(total);
        [arrM addObject:@(temp)];
        total -= temp;
    }
    if (temp) {
        [arrM addObject:@(temp)];
    }
    return arrM;
}

- (void)drawRect:(CGRect)rect {
    NSArray *arr = [self arrRandom];
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat startA = 0;
    CGFloat angel = 0;
    CGFloat endA = 0;
    
    for (int i = 0; i < arr.count; i++) {
        startA = endA;
        angel = [arr[i] doubleValue] / 100.0 * M_PI * 2;
        endA = startA + angel;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[self colorRandom] set];
        [path stroke];
        [path fill];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}
// 随机颜色
- (UIColor *)colorRandom {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

// 老方法
- (void)drawRect {
    CGFloat radius = self.bounds.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    CGFloat startA = 0;
    CGFloat angel = 0;
    CGFloat endA = 0;
    
    // 第1个扇形
    angel = 25 / 100.0 * M_PI * 2;
    endA = startA + angel;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    // 添加一根线到圆心
    [path addLineToPoint:center];
    // 描边和填充通用
    [[UIColor redColor] set];
    [path fill];
    [path stroke];
    
    // 第2个扇形
    startA = endA;
    angel = 25 / 100.0 * M_PI * 2;
    endA = startA + angel;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    // 添加一根线到圆心
    [path2 addLineToPoint:center];
    // 描边和填充通用
    [[UIColor blueColor] set];
    [path2 fill];
    [path2 stroke];
    
    // 第3个扇形
    startA = endA;
    angel = 50 / 100.0 * M_PI * 2;
    endA = startA + angel;
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    // 添加一根线到圆心
    [path3 addLineToPoint:center];
    // 描边和填充通用
    [[UIColor greenColor] set];
    [path3 fill];
    [path3 stroke];
}

@end
