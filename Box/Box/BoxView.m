//
//  Created by 李丝思
//  Copyright © 2018年 思. All rights reserved.
//

#import "BoxView.h"

@implementation BoxView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.boxBig = [[BoxModel alloc]init];
        self.boxmix = [[BoxModel alloc]init]; 
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)setMaxH:(CGFloat)maxH{
    _maxH = maxH;
}
-(void)setMaxL:(CGFloat)maxL{
    _maxL = maxL;
}
-(void)setMaxW:(CGFloat)maxW{
    _maxW = maxW;
}


-(void)updatBoxModel{
    [self.boxBig updateL:self.maxL w:self.maxW h:self.maxH];
}
- (void)drawRect:(CGRect)rect {
    self.context = UIGraphicsGetCurrentContext();
    [self huabu1:self.boxBig contxt:self.context color:[UIColor whiteColor] isBgBox:YES];
    [self huabu1:self.boxmix contxt:self.context color:[UIColor colorWithRed:45/255.0 green:165/255.0 blue:152/255.0   alpha:1] isBgBox:NO];
}


-(void)updateL:(CGFloat )L w:(CGFloat)w h:(CGFloat)h{
    [self.boxmix updateL:L w:w h:h];
    CGPoint movePoint = CGPointMake(self.boxBig.z0.x - self.boxmix.z0.x , self.boxBig.z0.y - self.boxmix.z0.y);
    [self.boxmix movePoin:movePoint];
    [self update];
}
-(void)update{
    [self setNeedsDisplay];
}



-(void)huabu1:(BoxModel *)box contxt:(CGContextRef )context color:(UIColor*)color isBgBox:(BOOL)isBgBox {
    [color set];
    ///前面的
    CGPoint sPoints0[4];
    sPoints0[0] = box.y3;
    sPoints0[1] = box.y2;
    sPoints0[2] = box.z2;
    sPoints0[3] = box.z3;
    CGContextAddLines(context, sPoints0, 4);//添加线
    if (isBgBox == YES) {
        [[UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1]setStroke];
    } else {
        [color setStroke];
    }
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    ////画右边
    CGPoint sPoints[4];//坐标点
    sPoints[0] =box.y1;//坐标1
    sPoints[1] =box.z1;
    sPoints[2] = box.z2;
    sPoints[3] = box.y2;
    CGContextAddLines(context, sPoints, 4);//添加线
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    ////画上边
    CGPoint sPoints2[4];//坐标点
    sPoints2[0] = box.y0;
    sPoints2[1] = box.y1;
    sPoints2[2] = box.y2;
    sPoints2[3] = box.y3;
    CGContextAddLines(context, sPoints2, 4);//添加线
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    ///画底部线
    CGFloat dashArray1[] = {5, 5}; // 表示先绘制10个点，再跳过10个点
    //    CGContextSetLineWidth(context, 0.3); // 设置线的宽度
    CGContextSetLineDash(context, 0, dashArray1, 2); // 画虚线
    //指定直线样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    //直线宽度
   CGContextSetLineWidth(context, 0.3);
    //设置颜色
    CGContextSetRGBStrokeColor(context, 179/255.0,  179/255.0,  179/255.0, 1.0);
    //开始绘制
    CGContextBeginPath(context);
    //画笔移动到点(31,170)
    CGContextMoveToPoint(context, box.y0.x, box.y0.y);
    //下一点
    CGContextAddLineToPoint(context, box.z0.x, box.z0.y);
    //下一点
    CGContextAddLineToPoint(context, box.z3.x, box.z3.y);
    //绘制完成
    CGContextStrokePath(context);
    
    ///画里面的一横线
    //指定直线样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    //直线宽度
    CGContextSetLineWidth(context, 0.3);
    //设置颜色
    CGContextSetRGBStrokeColor(context, 179/255.0,  179/255.0,  179/255.0, 1.0);
    //开始绘制
    CGContextBeginPath(context);
    CGContextMoveToPoint(context,box.z0.x, box.z0.y);
    CGContextAddLineToPoint(context, box.z1.x,box.z1.y);
    //绘制完成
    CGContextStrokePath(context);
}
@end
