//
//  XYIndexPathViewController.m
//  XYDomo
//
//  Created by xinyu.wu on 2017/3/6.
//  Copyright © 2017年 xinyu.wu. All rights reserved.
//

#import "XYIndexPathViewController.h"

@interface XYIndexPathViewController ()

@end

@implementation XYIndexPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [self makeTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)makeTest
{
    //一节点
    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:6];
    NSLog(@"%@",indexPath);
    
    //多节点
    NSUInteger indexes[] = {2,5,6,9};
    indexPath = [NSIndexPath indexPathWithIndexes:indexes length:sizeof(indexes)/sizeof(*indexes)];
    NSLog(@"%@",indexPath);
    
    //
    NSUInteger index = [indexPath indexAtPosition:0];
    NSLog(@"%lu",(unsigned long)index);
    
    index = [indexPath indexAtPosition:3];
    NSLog(@"%lu",(unsigned long)index);
    
    index = [indexPath indexAtPosition:5];
    NSLog(@"%lu",(unsigned long)index);
}







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
