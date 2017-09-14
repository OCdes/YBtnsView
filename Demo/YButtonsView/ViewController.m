//
//  ViewController.m
//  YButtonsView
//
//  Created by xiuxinxiuxing on 2017/1/22.
//  Copyright © 2017年 HSYBS. All rights reserved.
//

#import "ViewController.h"
#import "YButtonsView.h"
#import "BtnStyle.h"
#import "BtnTitleModel.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *titleArr = [NSMutableArray array];
    NSArray *testArr = @[@{
                             @"job_category_name":@"码农",
                             @"job_category_id":@"1"
                             },@{
                             @"job_category_name":@"码农码农",
                             @"job_category_id":@"2"
                             },@{
                             @"job_category_name":@"码农码农",
                             @"job_category_id":@"3"
                             },@{
                             @"job_category_name":@"码农码农",
                             @"job_category_id":@"4"
                             },@{
                             @"job_category_name":@"码农",
                             @"job_category_id":@"5"
                             },@{
                             @"job_category_name":@"码农啊",
                             @"job_category_id":@"6"
                             },@{
                             @"job_category_name":@"码农",
                             @"job_category_id":@"7"
                             },@{
                             @"job_category_name":@"码农码农啊",
                             @"job_category_id":@"8"
                             },@{
                             @"job_category_name":@"码农",
                             @"job_category_id":@"9"
                             },@{
                             @"job_category_name":@"码农码农啊",
                             @"job_category_id":@"11"
                             },@{
                             @"job_category_name":@"码农码农啊",
                             @"job_category_id":@"12"
                             },@{
                             @"job_category_name":@"码农农农农",
                             @"job_category_id":@"13"
                             },@{
                             @"job_category_name":@"农农农",
                             @"job_category_id":@"14"
                             },@{
                             @"job_category_name":@"码农码农啊",
                             @"job_category_id":@"15"
                             },@{
                             @"job_category_name":@"码农",
                             @"job_category_id":@"16"
                             },@{
                             @"job_category_name":@"码农农",
                             @"job_category_id":@"18"
                             }];
    for (int i = 0; i < testArr.count; i ++) {
        BtnTitleModel *model = [BtnTitleModel new];
        NSDictionary *dict = testArr[i];
        model.job_category_name = dict[@"job_category_name"];
        model.job_category_id = dict[@"job_category_id"];
        [titleArr addObject:model.job_category_name];
    }
    BtnStyle *style = [BtnStyle share];
    YButtonsView *btnsView = [[YButtonsView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height-64) BtnStyle:style titleArr:titleArr];
    btnsView.block = ^(NSArray *cateNames, NSArray *indexs) {
        //cateNames选中的name数组,indexs选中的index数组
    };
    CGRect frame = btnsView.frame;
    frame.size.height = btnsView.realHeight;
    btnsView.frame = frame;
    [self.view addSubview:btnsView];
    btnsView.backgroundColor = [UIColor greenColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
