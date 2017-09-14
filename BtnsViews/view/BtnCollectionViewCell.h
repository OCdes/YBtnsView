//
//  BtnCollectionViewCell.h
//  CloneFactoryApp
//
//  Created by xiuxinxiuxing on 2017/1/22.
//  Copyright © 2017年 CSCHS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BtnStyle.h"
@class BtnsBtn;
@class BtnTitleModel;
@protocol BtnCollectionViewCellDelegate <NSObject>

- (void)tapCategoryBtn:(BtnsBtn *)btn;

@end

@interface BtnCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) BtnsBtn *btn;

@property (nonatomic, strong) BtnStyle *style;

@property (nonatomic, strong) BtnTitleModel *model;

@property (nonatomic, weak) id<BtnCollectionViewCellDelegate> delegate;

@end
