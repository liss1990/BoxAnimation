
//
//  Created by 李丝思 
//  Copyright © 2018年 思. All rights reserved.
//
 
#import <UIKit/UIKit.h>
@interface BoxModel : NSObject

@property(nonatomic,assign)CGPoint z0;
@property(nonatomic,assign)CGPoint z1;
@property(nonatomic,assign)CGPoint z2;
@property(nonatomic,assign)CGPoint z3;

///上面4个点
@property(nonatomic,assign)CGPoint y0;
@property(nonatomic,assign)CGPoint y1;
@property(nonatomic,assign)CGPoint y2;
@property(nonatomic,assign)CGPoint y3;

-(void)movePoin:(CGPoint )point;

-(void)updateL:(CGFloat )L w:(CGFloat)w h:(CGFloat)h;
@end
