//
//  Created by 李丝思 
//  Copyright © 2018年 思. All rights reserved.
//

#import "LuggageTableViewCell.h" 
#define WeakSelf(type)  __weak typeof(type) weak##type = type;

#define L  91*SCALE_WIDTH
#define H  150*SCALE_WIDTH
#define W   72*SCALE_WIDTH

@implementation LuggageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initView];
    }
    
    return self;
    
}

-(void)initView{
    self.backgroundColor = [[UIColor alloc ]initWithRed:245/255.0 green:245/255.0  blue:245/255.0  alpha:1];
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1/1.0];
    [self.contentView addSubview:self.bgView];
    self.bgView.sd_layout.topSpaceToViewScale(self.contentView, 10)
    .leftSpaceToViewScale(self.contentView, 15)
    .bottomSpaceToViewScale(self.contentView,5)
    .rightSpaceToViewScale(self.contentView, 15);
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 10;
    
    self.h1 = H;
    self.w = W;
    self.l = L;
    self.boxView = [[BoxView alloc]initWithFrame:CGRectMake(1,1, L  + W  * 0.707 ,H + W * 0.707 )];
    self.boxView.maxH = self.h1;
    self.boxView.maxW = self.w;
    self.boxView.maxL = self.l;
    [self.boxView updatBoxModel];
    [self.bgView addSubview:self.boxView];
    self.boxView.sd_layout.leftSpaceToViewScale(self.bgView, 10).topSpaceToViewScale(self.bgView, 10).widthIs( L  + W  * 0.707 ).heightIs(H + W * 0.707 );
////
    self.smallView = [[UIView alloc]initWithFrame:CGRectMake(10*SCALE_WIDTH, 70*SCALE_WIDTH, L  + W  * 0.707 ,H + W * 0.707 )];
    self.smallView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:self.smallView];
    self.smallView.sd_layout.leftSpaceToViewScale(self.bgView, 10).topSpaceToViewScale(self.bgView, 10).widthIs(W  * 0.707 ).heightIs(1);
    self.smallView1 = [[UIView alloc]initWithFrame:CGRectMake(10*SCALE_WIDTH, 70*SCALE_WIDTH, L  + W  * 0.707 ,H + W * 0.707 )];
    self.smallView1.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:self.smallView1];
    self.smallView1.sd_layout.rightEqualToView(self.boxView).bottomEqualToView(self.bgView).widthIs(1).heightIs(W  * 0.707);
    
    self.lengthView = [[CalibrationView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, CGRectGetMaxY(self.contentView.frame)+10, (SCREEN_WIDTH-30-20)/2, 46)];
    [self.bgView addSubview:self.lengthView ];
    self.lengthView.typeString = @"长";
    self.lengthView.typeSlider.tag = 0;
    WeakSelf(self)
    self.lengthView.sliderBlock = ^(CGFloat sdValue) {
        weakself.sliderLBlock(60.0 * sdValue, weakself.cellTag);
        [weakself updataSenderData];
    };
    self.lengthView.sd_layout.topSpaceToViewScale(self.bgView, 15)
    .leftSpaceToViewScale(self.boxView, 25).rightSpaceToViewScale(self.bgView, 15).heightIsScale(46);
    
    self.widthView = [[CalibrationView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, CGRectGetMaxY(self.contentView.frame)+10, (SCREEN_WIDTH-30-20)/2, 46)];
    self.widthView.typeString = @"宽";
    self.widthView.typeSlider.tag = 1;
    self.widthView.sliderBlock = ^(CGFloat sdValue) {
         weakself.sliderWBlock(30.0 * sdValue,  weakself.cellTag);
        [weakself updataSenderData];
        
    };
    [self.bgView addSubview:self.widthView ];
    self.widthView.sd_layout.topSpaceToViewScale(self.lengthView, 15)
    .leftSpaceToViewScale(self.boxView, 25).rightSpaceToViewScale(self.bgView, 15).heightIsScale(46);
    
    self.heightView = [[CalibrationView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, CGRectGetMaxY(self.contentView.frame)+10, (SCREEN_WIDTH-30-20)/2, 46)];
    self.heightView.typeString = @"高";
    self.heightView.sliderBlock = ^(CGFloat sdValue) {
        [weakself updataSenderData];
         weakself.sliderHBlock(100.0 * sdValue,  weakself.cellTag);
    };
    [self.bgView addSubview:self.heightView ];
    
    self.heightView.sd_layout.topSpaceToViewScale(self.widthView, 15)
    .leftSpaceToViewScale(self.boxView, 25).rightSpaceToViewScale(self.bgView, 15).heightIsScale(46);
    
}

-(void)updataSenderData{
    CGFloat l = L * self.lengthView.typeSlider.value;
    CGFloat w = W * self.widthView.typeSlider.value;
    CGFloat h = H * self.heightView.typeSlider.value;
    [self.boxView updateL:l  w:w h: h ]; 
}


-(void)tapSelectBtn:(UIButton*)sender{
    sender.selected = !sender.selected; 
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
