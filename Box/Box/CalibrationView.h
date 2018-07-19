 

#import <UIKit/UIKit.h>

typedef void(^SliderUpdateBlock)(CGFloat sdValue);

@interface CalibrationView : UIView
@property(nonatomic,strong)NSString *typeString;
/**
 长
 */
@property(nonatomic,strong)UILabel *typeLabel;
@property(nonatomic,strong)UILabel *typeDatalabel;
@property(nonatomic,strong)UILabel *typeDataExplainlabel;
@property(nonatomic,strong)UISlider *typeSlider;
@property(nonatomic,strong)UILabel *type0Label;
@property(nonatomic,strong)UILabel *type30Label;
@property(nonatomic,strong)UILabel *type60Label;
@property(nonatomic,strong)UILabel *type100Label;
@property(nonatomic,strong)SliderUpdateBlock sliderBlock;

@property(nonatomic,assign)CGFloat date;

@end
