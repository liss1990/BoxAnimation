
//  Created by 李丝思 
//  Copyright © 2018年 思. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoxModel.h"
@interface BoxView : UIView
@property(nonatomic,strong)BoxModel *boxBig;
@property(nonatomic,strong)BoxModel *boxmix;
@property(nonatomic,assign)CGContextRef context; 
@property(nonatomic,assign)CGFloat maxL;
@property(nonatomic,assign)CGFloat maxW;
@property(nonatomic,assign)CGFloat maxH;
-(void)updatBoxModel;
-(void)updateL:(CGFloat )L w:(CGFloat)w h:(CGFloat)h;
@end
