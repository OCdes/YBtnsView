//
//  BtnStyle.m
//  CloneFactoryApp
//
//  Created by xiuxinxiuxing on 2017/1/22.
//  Copyright © 2017年 CSCHS. All rights reserved.
//

#import "BtnStyle.h"

@implementation BtnStyle
static dispatch_once_t onceToken;
static BtnStyle *_instance;
+(instancetype)share {
    dispatch_once(&onceToken, ^{
        _instance = [[BtnStyle alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.btnBoderWith = 1.f;
        self.btnBoderColor = [UIColor redColor];
        self.titleFont = 14.f;
        self.normalTitleColor = [UIColor blackColor];
        self.selectTitleColor = [UIColor whiteColor];
        self.normalColor = [UIColor whiteColor];
        self.selectColor = [UIColor orangeColor];
        self.btnRadius = 5;
        self.rowInterval = 10.f;
        self.colInterval = 10.f;
        self.isBasicSize = NO;
        self.btnHeight = 30;
        self.basicSize = CGSizeMake((Screen_Width-5*self.colInterval)/4, self.btnHeight+10);
        self.isMutiSelect = NO;
    }
    return self;
}


//+ (void)deallocInstance {
//    onceToken = 0;
//    _instance = nil;
//}

@end
