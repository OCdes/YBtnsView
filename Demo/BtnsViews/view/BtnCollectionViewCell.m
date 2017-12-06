//
//  BtnCollectionViewCell.m
//  CloneFactoryApp
//
//  Created by xiuxinxiuxing on 2017/1/22.
//  Copyright © 2017年 CSCHS. All rights reserved.
//

#import "BtnCollectionViewCell.h"
#import "BtnsBtn.h"
#import "BtnTitleModel.h"
#import <UIKit/UIKit.h>
@interface BtnCollectionViewCell ()



@end

@implementation BtnCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.btn = [BtnsBtn new];
        self.btn.tag = self.tag;
        [self.contentView addSubview:self.btn];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self.contentView);
        }];
        self.btn.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setStyle:(BtnStyle *)style {
    _style = style;
    self.btn.titleLabel.font = [UIFont systemFontOfSize:style.titleFont];
    [self.btn setTitleColor:style.normalTitleColor forState:UIControlStateNormal];
    [self.btn setTitleColor:style.selectTitleColor forState:UIControlStateSelected];
    [self.btn setTitleColor:style.normalTitleColor forState:UIControlStateNormal];
    self.btn.layer.cornerRadius = _style.btnRadius;
    self.btn.layer.masksToBounds = YES;
}

- (void)setModel:(BtnTitleModel *)model {
    [self.btn setTitle:model.job_category_name forState:UIControlStateNormal];
    self.btn.selected = model.beSelected;
    if (model.beSelected) {
        self.btn.layer.borderColor = _style.selectColor.CGColor;
        self.btn.layer.borderWidth = _style.btnBoderWith;
        self.btn.backgroundColor = _style.selectColor;
    } else {
        self.btn.layer.borderColor = _style.btnBoderColor.CGColor;
        self.btn.layer.borderWidth = _style.btnBoderWith;
        self.btn.backgroundColor = _style.normalColor;
    }
}

@end
