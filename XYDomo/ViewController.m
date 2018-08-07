//
//  ViewController.m
//  XYDomo
//
//  Created by xinyu.wu on 2017/3/6.
//  Copyright © 2017年 xinyu.wu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    [_dataArray addObject:@[@"NSIndexPath-索引",@"XYIndexPathViewController"]];
    [_dataArray addObject:@[@"ReloadData-解析",@"XYReloadViewController"]];
    [_dataArray addObject:@[@"WKWebView-加载",@"XYWebViewController"]];
    [_dataArray addObject:@[@"XYProtocol-协议",@"XYProtocolViewController"]];
    [_dataArray addObject:@[@"Block-回调",@"XYBlockViewController"]];
    [_dataArray addObject:@[@"UIScrollView-dealloc",@"XYScrolViewController"]];
    [_dataArray addObject:@[@"XYAttribute-属性字符串",@"XYAttributeViewController"]];
    [_dataArray addObject:@[@"XYTypeC-语法",@"XYTypeCViewController"]];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSArray *titleArray = _dataArray[indexPath.row];
    cell.textLabel.text = titleArray[0];
    cell.detailTextLabel.text = titleArray[1];
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *titleArray = _dataArray[indexPath.row];
    
    NSString *class = titleArray[1];
    
    const char *className = [class cStringUsingEncoding:NSASCIIStringEncoding];
    // 从一个字串返回一个类
    Class newClass = objc_getClass(className);
    UIViewController *vc = [[newClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)handleReceiveMessage:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    NSLog(@"%@",userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
