//
//  Created by 李丝思 
//  Copyright © 2018年 思. All rights reserved.
//

#import "BoxModel.h"

@implementation BoxModel

-(void)movePoin:(CGPoint)point{
    self.z0 = CGPointMake(point.x + self.z0.x, self.z0.y+point.y);
    self.z1 = CGPointMake(point.x + self.z1.x, self.z1.y+point.y);
    self.z2 = CGPointMake(point.x + self.z2.x, self.z2.y+point.y);
    self.z3 = CGPointMake(point.x + self.z3.x, self.z3.y+point.y);
    
    self.y0 = CGPointMake(point.x + self.y0.x, self.y0.y+point.y);
    self.y1 = CGPointMake(point.x + self.y1.x, self.y1.y+point.y);
    self.y2 = CGPointMake(point.x + self.y2.x, self.y2.y+point.y);
    self.y3 = CGPointMake(point.x + self.y3.x, self.y3.y+point.y);
}

-(void)updateL:(CGFloat )L w:(CGFloat)w h:(CGFloat)h{
    CGFloat geng = 0.707;
    self.z0 = CGPointMake( w * geng, h);// newz0; 
    self.z1 = CGPointMake(L + w * geng, h) ;//newz1;
    self.z2 = CGPointMake(L, h + w * geng);// newz2;
    self.z3 = CGPointMake(0, h + w * geng);// newz3;
    self.y0 = CGPointMake(w*geng, 0); //newy0;
    self.y1 = CGPointMake(L + w *geng, 0);// newy1;
    self.y2 = CGPointMake(L, w * geng);// newy2;
    self.y3 = CGPointMake(0, w * geng);// newy3;
}
@end
