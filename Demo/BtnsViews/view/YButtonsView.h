//
//  BtnsView.h
//  CloneFactoryApp
//
//  Created by xiuxinxiuxing on 2017/1/22.
//  Copyright © 2017年 CSCHS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BtnStyle;
@interface YButtonsView : UIView

/**
 当前已选中的nameArray
 */
@property (nonatomic, strong) NSMutableArray *namesArr;


/**
 获取当前collectionView的实际高度，以便调整容器高度
 */
@property (nonatomic, assign) CGFloat realHeight;

/**
 通过block回传选中的分类名字，以及分类的index
 */
@property (nonatomic, copy) void(^block)(NSArray *cateNames, NSArray *indexs);

/**
 不规则按钮,排列换行

 @param frame 此frame起到设定 x,y,width的目的，高度将会进行修正，初始化后，请注意调整superView的frame
 @param style 按钮样式设置类，请初始化style，并对相应的按钮参数赋值
 @param titles 按钮的标题数组
 @return 返回本类的实例
 */
- (instancetype)initWithFrame:(CGRect)frame BtnStyle:(BtnStyle *)style titleArr:(NSArray *)titles;

- (void)reloadDataWithArr:(NSArray *)titles;

@end
