//
//  XYReloadViewController.m
//  XYDomo
//
//  Created by xinyu.wu on 2017/5/22.
//  Copyright © 2017年 xinyu.wu. All rights reserved.
//

//关于performSelector这篇文章有很多借鉴之处http://www.cnblogs.com/ChouDanDan/p/5784317.html

#import "XYReloadViewController.h"
#import <objc/runtime.h>

@interface XYReloadViewController ()
<UITableViewDelegate,
UITableViewDataSource
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation XYReloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(rightBarButtonItemClick)];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)rightBarButtonItemClick
{
    [_dataArray addObject:@[@"新加的的0",@"XYScrolViewController"]];
    [_dataArray addObject:@[@"新加的的1",@"XYScrolViewController"]];
    [_dataArray addObject:@[@"新加的的2",@"XYScrolViewController"]];
    
    [self.tableView reloadData];

    
    /*
    //在主线程内新开了一个线程，系统CPU是切换执行主线程和子线程。先调用主线程执行一段时间，子线程执行一段时间。
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(startThread) object:nil];
    [thread start];
     */
    
    /*
     //这个方法是异步执行，方法aselectot会被放在方法队列的末尾，待主线程中其他方法执行完成之后才会执行aselectot
     //这个方法只能在主线程中调用。子线程中调用aselectot不会执行。
     //可用来在[self.tableView reloadData]之后进行某些操作。
     [self performSelector:@selector(aselectot) withObject:nil afterDelay:0.0];
     */
    
    /*
     //UntilDone: 是否等待执行完aselectot之后再执行线程中其他函数 YES等待 NO立刻执行
     // NO:异步执行aselectot 在主线程执行完其他方法之后才会执行aselectot
     // YES:同步执行aselectot 先执行aselectot方法，然后在执行线程中其他方法。
     */
//    [self performSelectorOnMainThread:@selector(aselectot) withObject:nil waitUntilDone:NO];
    
    //在主线程执行，一直占用主线程资源直到结束。
    /*
    NSDate *startTime = [NSDate date];
    NSLog(@"12345:继续");
    for (int i = 0; i< 1000000000; i++) {
        if (i == 1000000000 - 1) {
            NSLog(@"12345:结束");
        }
    }
    NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);
    */
     
    /*
     *这里交换了数组中的第一个元素，相应的tableview也交换了
     *证明了[self.tableView reloadData]中给cell赋值那一步是异步执行的。
     *一般情况下是在本函数执行完成之后才执行cell赋值
     */
//    [_dataArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
}

-(void)aselectot
{
    NSLog(@"12345:2");
}

-(void)startThread
{
    NSLog(@"12345:线程内");
    [self performSelectorOnMainThread:@selector(aselectot) withObject:nil waitUntilDone:NO];//NO:异步执行aselectot YES:同步执行aselectot
//    [self aselectot];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSLog(@"12345:3");
    
    NSArray *titleArray = _dataArray[indexPath.row];
    cell.textLabel.text = titleArray[0];
    cell.detailTextLabel.text = titleArray[1];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"12345:4");
    return 60;
}
/*
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *sectionHead = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"sectionHead"];
    if (!sectionHead) {
        sectionHead = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"sectionHead"];
        sectionHead.contentView.backgroundColor = [UIColor redColor];
    }
    return sectionHead;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *sectionFoot = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"sectionFoot"];
    if (!sectionFoot) {
        sectionFoot = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"sectionFoot"];
        sectionFoot.contentView.backgroundColor = [UIColor cyanColor];
    }
    return sectionFoot;
}
*/
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
