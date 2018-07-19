//
//  SDAutoLayoutModel+extendSDAutoLayout.h
//

#import <SDAutoLayout/SDAutoLayout.h>
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define SCALE_WIDTH SCREEN_WIDTH / 375
#define SCALE_HEIGHT SCREEN_HEIGHT / 667
@interface SDAutoLayoutModel (extendSDAutoLayout)
@property(nonatomic, strong) SDAutoLayoutModelItem *width;
@property(nonatomic, strong) SDAutoLayoutModelItem *height;
@property(nonatomic, copy, readonly) MarginToView leftSpaceToViewScale;

/** 右边到其参照view之间的间距，参数为“(View, CGFloat)”  */
@property(nonatomic, copy, readonly) MarginToView rightSpaceToViewScale;
/** 顶部到其参照view之间的间距，参数为“(View 或者 view数组, CGFloat)”  */
@property(nonatomic, copy, readonly) MarginToView topSpaceToViewScale;
/** 底部到其参照view之间的间距，参数为“(View, CGFloat)”  */
@property(nonatomic, copy, readonly) MarginToView bottomSpaceToViewScale;

/** 宽度值，参数为“(CGFloat)”  */
@property(nonatomic, copy, readonly) WidthHeight widthIsScale;
/** 高度值，参数为“(CGFloat)”  */
@property(nonatomic, copy, readonly) WidthHeight heightIsScale;

@end
