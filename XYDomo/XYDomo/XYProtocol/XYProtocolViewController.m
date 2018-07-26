//
//  XYProtocolViewController.m
//  XYDomo
//
//  Created by xinyu.wu on 2017/6/7.
//  Copyright © 2017年 xinyu.wu. All rights reserved.
//

#import "XYProtocolViewController.h"
#import "XYModelProtocol.h"

@interface XYProtocolViewController ()
///<
//XYModelProtocol
//>
@end

@implementation XYProtocolViewController

/*
 目标：本类想继承另一个类的属性、并且可直接读写、相当于多继承
 结果：目前来看无法解决这个问题。
 原因：1、OC中不支持多继承 2、使用protocal只能继承方法名、继承不了方法的实现。
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.meTitle = @"123";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
