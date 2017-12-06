
//
//  BtnsView.m
//  CloneFactoryApp
//
//  Created by xiuxinxiuxing on 2017/1/22.
//  Copyright © 2017年 CSCHS. All rights reserved.
//

#import "YButtonsView.h"
#import "BtnSizeModel.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "BtnTitleModel.h"
#import "BtnCollectionViewCell.h"
#import "BtnsBtn.h"
@interface YButtonsView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateLeftAlignedLayout>

@property (nonatomic, strong) UICollectionView *collection;

@end

@implementation YButtonsView {
    NSMutableArray *_sizeArr;
    NSMutableArray *_titlesArr;
    BtnStyle *_style;
    NSMutableArray *_selectArr;
}

static NSString *identitfier = @"btnCellId";

- (instancetype)initWithFrame:(CGRect)frame BtnStyle:(BtnStyle *)style titleArr:(NSArray *)titles {
    if (self = [super initWithFrame:frame]) {
        _selectArr = [NSMutableArray array];
        _titlesArr = [NSMutableArray array];
        _style = style;
        _sizeArr = [NSMutableArray array];
        CGSize basicSize = CGSizeMake(70, style.btnHeight);
        if (style.isBasicSize) {
            basicSize = style.basicSize;
        } 
        if (titles.count) {
            for (int i = 0; i < titles.count; i ++ ) {
                BtnSizeModel *model = [BtnSizeModel new];
                BtnTitleModel *titleModel = [BtnTitleModel new];
                titleModel.job_category_name = titles[i];
                CGSize size = [titles[i]  boundingRectWithSize:CGSizeMake(MAXFLOAT, basicSize.height) withFont:style.titleFont];
                if (_style.isBasicSize) {
                    if (size.width > basicSize.width) {
                        model.width = size.width + 20;
                        model.height = basicSize.height;
                    } else {
                        model.width = basicSize.width;
                        model.height = basicSize.height;
                    }
                } else {
                    if (model.width < Screen_Width - 20) {
                        model.width = size.width + 20;
                        model.height = basicSize.height;
                    } else {
                        model.width = Screen_Width - 20;
                        model.height = basicSize.height;
                    }
                    
                }
                
                [_sizeArr addObject:model];
                [_titlesArr addObject:titleModel];
            }
        }
        UICollectionViewLeftAlignedLayout *leftLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
        leftLayout.minimumLineSpacing = 10;
        leftLayout.minimumInteritemSpacing = 10;
        leftLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:leftLayout];
        self.collection.backgroundColor = [UIColor clearColor];
        self.collection.delegate = self;
        self.collection.dataSource = self;
        [self.collection registerClass:[BtnCollectionViewCell class] forCellWithReuseIdentifier:identitfier];
        [self addSubview:self.collection];
        [self.collection mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self);
        }];
        [self.collection reloadData];
        CGRect rect = self.frame;
        rect.size.height = self.collection.contentSize.height > self.frame.size.height ?self.frame.size.height:self.collection.contentSize.height;
        if (self.collection.contentSize.height > self.frame.size.height) {
            self.collection.scrollEnabled = YES;
        } else {
            self.collection.scrollEnabled = NO;
        }
    }
    return self;
}

#pragma mark - UICollectionView Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _titlesArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BtnTitleModel *model = _titlesArr[indexPath.item];
    BtnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identitfier forIndexPath:indexPath];
    cell.style = _style;
    model.beSelected = [self.namesArr containsObject:model.job_category_name];
    cell.model = model;
    cell.tag = indexPath.item;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    BtnSizeModel *model = _sizeArr[indexPath.item];
    return CGSizeMake(model.width, model.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_style.isMutiSelect) {
        for (BtnTitleModel *model in _titlesArr) {
            if ([_titlesArr indexOfObject:model] == indexPath.item) {
                if (model.beSelected) {
                    [_namesArr removeObject:model.job_category_name];
                    [_selectArr removeObject:@(indexPath.item)];
                }else {
                    if (!_namesArr) {
                        _namesArr = [NSMutableArray array];
                    }
                    [_selectArr addObject:@(indexPath.item)];
                    [_namesArr addObject:model.job_category_name];
                }
                
            }
        }
        if (_block) {
            _block(_namesArr,_selectArr);
        }
    } else {
        if (!_namesArr) {
            _namesArr = [NSMutableArray array];
        }
        [_namesArr removeAllObjects];
        [_selectArr removeAllObjects];
        [_namesArr addObject:[_titlesArr[indexPath.item] job_category_name]];
        [_selectArr addObject:@(indexPath.item)];
        if (_block) {
            _block(_namesArr,_selectArr);
        }
    }
    [self.collection reloadData];
}

- (void)reloadDataWithArr:(NSArray *)titles {
    [_titlesArr removeAllObjects];
    [_sizeArr removeAllObjects];
    CGSize basicSize = CGSizeMake(70, _style.btnHeight);
    if (_style.isBasicSize) {
        basicSize = _style.basicSize;
    }
    if (titles.count) {
        for (int i = 0; i < titles.count; i ++ ) {
            BtnSizeModel *model = [BtnSizeModel new];
            BtnTitleModel *titleModel = [BtnTitleModel new];
            titleModel.job_category_name = titles[i];
            CGSize size = [titles[i]  boundingRectWithSize:CGSizeMake(MAXFLOAT, basicSize.height) withFont:_style.titleFont];
            if (size.width > basicSize.width) {
                if ((size.width + 20) <= Screen_Width) {
                    model.width = size.width + 20;
                } else {
                    model.width = Screen_Width - 20;
                }
                
                model.height = basicSize.height;
            } else {
                model.width = basicSize.width;
                model.height = basicSize.height;
            }
            [_sizeArr addObject:model];
            [_titlesArr addObject:titleModel];
        }
    }
    [self.collection reloadData];
}

- (CGFloat)realHeight {
    CGFloat width = 0;
    for (BtnSizeModel *model in _sizeArr) {
        width += model.width+10;
    }
    NSInteger num = width/Screen_Width;
    num += (width-num*Screen_Width)?1:0;
    return num * (_style.basicSize.height);
}

@end
