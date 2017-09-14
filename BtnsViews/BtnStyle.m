//
//  BtnStyle.m
//  CloneFactoryApp
//
//  Created by xiuxinxiuxing on 2017/1/22.
//  Copyright © 2017年 CSCHS. All rights reserved.
//

#import "BtnStyle.h"

#define Black3 [self colorWithHexString:@"#333333"]

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
        self.btnBoderColor = [self colorWithHexString:@"00ac15"];
        self.titleFont = 14.f;
        self.normalTitleColor = Black3;
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

- (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

//+ (void)deallocInstance {
//    onceToken = 0;
//    _instance = nil;
//}

@end
