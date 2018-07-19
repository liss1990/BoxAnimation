
//
//  Created by 李丝思 
//  Copyright © 2018年 思. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalibrationView.h"
#import "BoxView.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import "SDAutoLayoutModel+extendSDAutoLayout.h"

typedef void(^SliderLBlock)(CGFloat sdValue, NSInteger tag);
typedef void(^SliderHBlock)(CGFloat sdValue, NSInteger tag);
typedef void(^SliderWBlock)(CGFloat sdValue, NSInteger tag);
typedef void(^SliderKGBlock)(CGFloat sdValue, NSInteger tag);


@interface LuggageTableViewCell : UITableViewCell

@property(nonatomic,strong)SliderLBlock sliderLBlock;
@property(nonatomic,strong)SliderHBlock sliderHBlock;
@property(nonatomic,strong)SliderWBlock sliderWBlock;
@property(nonatomic,strong)SliderKGBlock sliderKGBlock;

@property(nonatomic,strong)UIView *bgView;

@property(nonatomic,strong)BoxView *boxView;
@property(nonatomic,strong)UIView *smallView;
@property(nonatomic,strong)UIView *smallView1;

@property(nonatomic,assign)NSInteger cellTag;

@property(nonatomic,assign)CGFloat h1;
@property(nonatomic,assign)CGFloat w;
@property(nonatomic,assign)CGFloat l;
/**
长
 */
@property(nonatomic,strong)CalibrationView *lengthView;
/**
宽
 */
@property(nonatomic,strong)CalibrationView *widthView;

/**
 高
 */
@property(nonatomic,strong)CalibrationView *heightView; 
@end
