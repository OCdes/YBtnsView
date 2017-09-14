//
//  BtnStyle.h
//  CloneFactoryApp
//
//  Created by xiuxinxiuxing on 2017/1/22.
//  Copyright © 2017年 CSCHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BtnStyle : NSObject


/**
 是否是多选,默认NO
 */
@property (nonatomic, assign) BOOL isMutiSelect;

/**
 按钮的边框线宽度 默认为1；
 */
@property (nonatomic, assign) CGFloat btnBoderWith;

/**
 按钮的边框线颜色 默认非选中状态下是黑色 #333333  选中状态下与背景色一致
 */
@property (nonatomic, assign) UIColor * btnBoderColor;

/**
 按钮标题字号，默认14
 */
@property (nonatomic, assign) CGFloat titleFont;

/**
 按钮标题颜色，默认为黑色 #333333
 */
@property (nonatomic, strong) UIColor *normalTitleColor;

/**
 选中状态下，按钮标题颜色，默认为白色
 */
@property (nonatomic, strong) UIColor *selectTitleColor;

/**
 非选中状态下背景颜色，默认为白色
 */
@property (nonatomic, strong) UIColor *normalColor;

/**
 选中状态下背景颜色，默认为 橙色  注：当不需要改变选中后的背景颜色时，请将该颜色设置为非选中状态的颜色
 */
@property (nonatomic, strong) UIColor *selectColor;

/**
 设置按钮的圆角，默认为5.f
 */
@property (nonatomic, assign) CGFloat btnRadius;

/**
 行间距 默认为10.f
 */
@property (nonatomic, assign) CGFloat rowInterval;

/**
 列间距 默认为 10.f
 */
@property (nonatomic, assign) CGFloat colInterval;

/**
 按钮的高度 默认30
 */
@property (nonatomic, assign) CGFloat btnHeight;

/**
 按钮是否设置基础尺寸，设置基础尺寸后，仅在文字长度超出了基础尺寸时，按钮尺寸才设定为文字尺寸，默认为NO
 */
@property (nonatomic, assign) BOOL isBasicSize;

/**
 按钮的基础尺寸，isBasicSize 为NO时，不用设置此项 // 设置为YES时，此basicSize根据列间距设定大小
 */
@property (nonatomic, assign) CGSize basicSize;

/**
 创建单例
 */
+(instancetype)share;

+ (void)deallocInstance;

@end
