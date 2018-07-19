//  Created by 李丝思 
//  Copyright © 2018年 思. All rights reserved.
//

#define RGB(R,G,B) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]
#define colo51    RGB(51,51,51)
#define colo230    RGB(230,230,230)
#define colo153    RGB(153,153,153)
#define colo204    RGB(204,204,204)
#define coloNav    RGB(38,166,154)
#define colobg  RGB(245,245,245)
#import "CalibrationView.h"
#import "SDAutoLayoutModel+extendSDAutoLayout.h"
@implementation CalibrationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView{
    self.typeLabel = [[UILabel alloc]init];
    self.typeLabel.textColor = colo153;
    self.typeLabel.text = @"长";
    self.typeLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.typeLabel];
    self.typeLabel.sd_layout.topSpaceToViewScale(self, 0).leftSpaceToViewScale(self, 0).widthIsScale(30).heightIsScale(19);
    self.typeDataExplainlabel = [[UILabel alloc]init];
    self.typeDataExplainlabel.textColor = colo153;
    self.typeDataExplainlabel.text = @"(19.5in)";
    self.typeDataExplainlabel.font = [UIFont systemFontOfSize:13];
    self.typeDataExplainlabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.typeDataExplainlabel];
    self.typeDataExplainlabel.sd_layout.topSpaceToViewScale(self, 0).widthIsScale(50).rightSpaceToViewScale(self, 0).heightIsScale(19); 
    
    self.typeDatalabel = [[UILabel alloc]init];
    self.typeDatalabel.textColor = colo51;
    self.typeDatalabel.font = [UIFont systemFontOfSize:13];
    self.typeDatalabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.typeDatalabel];
    self.typeDatalabel.sd_layout.topSpaceToViewScale(self, 0).leftSpaceToViewScale(self.typeLabel, 0).rightSpaceToViewScale(self.typeDataExplainlabel, 0).heightIsScale(19);
    UIImage *leftTrack = [[UIImage imageNamed:@"img_weight_progress_selected"]
                          resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    UIImage *rightTrack = [[UIImage imageNamed:@"img_progress_normal"]
                           resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    self.typeSlider = [[UISlider alloc]init];
    self.typeSlider.maximumValue = 1 ;
    self.typeSlider.minimumValue =0;
    [self.typeSlider addTarget:self action:@selector(updateSlider:) forControlEvents:UIControlEventValueChanged];
    [self.typeSlider setThumbImage:[UIImage imageNamed:@"img_circular_normal"] forState:UIControlStateNormal];
    self.typeSlider.maximumTrackTintColor =  [UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1/1.0];
    [self.typeSlider setMinimumTrackImage:leftTrack forState:UIControlStateNormal];
    [self.typeSlider setMaximumTrackImage:rightTrack forState:UIControlStateNormal];
    [self addSubview:self.typeSlider];
    self.typeSlider.sd_layout.topSpaceToViewScale(self.typeLabel, 5).leftSpaceToViewScale(self, 0).rightSpaceToViewScale(self, 0).heightIsScale(13);
    self.type0Label = [[UILabel alloc]init];
    self.type0Label.text = @"0";
    self.type0Label.font = [UIFont systemFontOfSize:12];
    self.type0Label.textColor = [UIColor colorWithRed:38/255.0 green:166/255.0 blue:154/255.0 alpha:1/1.0];
    [self addSubview:self.type0Label];
    self.type0Label.sd_layout.topSpaceToViewScale(self.typeSlider, 5).leftSpaceToViewScale(self, 0).heightIsScale(14).widthIsScale(8);
   
    self.type30Label = [[UILabel alloc]init];
    self.type30Label.text = @"30";
    self.type30Label.textAlignment = NSTextAlignmentCenter;
    self.type30Label.font = [UIFont systemFontOfSize:12];
    self.type30Label.textColor = colo153;
    [self addSubview:self.type30Label];
    self.type30Label.sd_layout.topSpaceToViewScale(self.typeSlider, 5).centerXEqualToView(self.typeSlider).heightIsScale(14).widthIsScale(30);
    self.type60Label = [[UILabel alloc]init];
    self.type60Label.text = @"60";
    self.type60Label.textAlignment = NSTextAlignmentCenter;
    self.type60Label.font = [UIFont systemFontOfSize:12];
    self.type60Label.textColor = colo153;
    self.type60Label.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.type60Label];
    self.type60Label.sd_layout.topSpaceToViewScale(self.typeSlider, 5).rightSpaceToViewScale(self, 0).heightIsScale(14).widthIsScale(30);
    
}
-(void)updateSlider:(UISlider*)sender{
    [self setDate2:sender.value * [self.type60Label.text floatValue]];
    self.sliderBlock(sender.value); 
}

-(void)setTypeString:(NSString *)typeString{
    _typeString = typeString;
    self.type100Label.hidden = YES;
    self.typeDatalabel.text = @"0cm";
    self.typeDataExplainlabel.text = @"(0in)";
    self.typeLabel.text =  typeString;
    if ([typeString isEqualToString:@"长"]) {
        self.type0Label.text = @"0";
        self.type30Label.text = @"30";
        self.type60Label.text = @"60";
    } else if ([typeString isEqualToString:@"宽"]) {
        self.type0Label.text = @"0";
        self.type30Label.text = @"15";
        self.type60Label.text = @"30";
    } else if ([typeString isEqualToString:@"高"]) {
        self.type0Label.text = @"0";
        self.type30Label.text = @"50";
        self.type60Label.text = @"100";
    }
}

-(void)setDate2:(CGFloat)date{
    CGFloat type30 =  [self.type30Label.text floatValue];
    CGFloat type60 =  [self.type60Label.text floatValue];
    if ((date > type30 || date == type30 ) && date < type60) {
        self.type30Label.textColor = [UIColor colorWithRed:38/255.0 green:166/255.0 blue:154/255.0 alpha:1/1.0];
        self.type60Label.textColor = colo153;
    } else if(date == type60) {
        self.type30Label.textColor = [UIColor colorWithRed:38/255.0 green:166/255.0 blue:154/255.0 alpha:1/1.0];
        self.type60Label.textColor =  [UIColor colorWithRed:38/255.0 green:166/255.0 blue:154/255.0 alpha:1/1.0];;
    }else{
        self.type30Label.textColor = colo153;
        self.type60Label.textColor = colo153;
    }
    self.typeDatalabel.text = [NSString stringWithFormat:@"%0.1fcm",date];
    self.typeDataExplainlabel.text = [NSString stringWithFormat:@"(%0.1fin)",date*0.394];
    
}

@end
