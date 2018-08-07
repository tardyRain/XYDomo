//
//  XYBlockViewController.m
//  XYDomo
//
//  Created by xinyu.wu on 2017/7/17.
//  Copyright © 2017年 xinyu.wu. All rights reserved.
//

#import "XYBlockViewController.h"

typedef void(^XYBlock)(void);

@interface XYBlockViewController ()
{
    XYBlock myBlock;
}

@property (nonatomic, strong) UIView *weakView;
@end

@implementation XYBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        
    UIView *view = [[UIView alloc] init];
    view.tag = 1000+4;
    _weakView = view;
    
    __weak typeof(self) weakSelf = self;
    myBlock = ^(){
        
        UIImageView *imageView = [[UIImageView alloc] init];
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            [strongSelf description];
        }
        NSLog(@"%@",view);
        NSLog(@"%@",imageView);
    };
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%@",_weakView);
    myBlock();
    myBlock = nil;
    NSLog(@"%@",_weakView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 现象：
 1、如果在viewDidLoad中的myBlock里面【不执行】NSLog(@"%@",view)，那么viewDidAppear中打印的的NSLog(@"%@",_weakView)为null。
 2、如果在viewDidLoad中的myBlock里面【执行】NSLog(@"%@",view)，那么viewDidAppear中打印的的NSLog(@"%@",_weakView)为xxx有值。
 
 3、如果在viewDidLoad中的myBlock里面【不执行】NSLog(@"%@",strongSelf.weakView);，那么viewDidAppear中打印的的NSLog(@"%@",_weakView)为null。
 4、如果在viewDidLoad中的myBlock里面【执行】NSLog(@"%@",strongSelf.weakView);，那么viewDidAppear中打印的的NSLog(@"%@",_weakView)为null。
 
 5、如果在viewDidAppear中【不执行】myBlock = nil;，那么viewDidAppear中打印的的NSLog(@"%@",_weakView)为xxx有值。
 5、如果在viewDidAppear中【执行】myBlock = nil;，那么viewDidAppear中打印的的NSLog(@"%@",_weakView)为null。
 */

/*
 只要执行了myBlock这句代码(不是块里面)、就会进行引用。具体如下
 0 对于那些被block引用的【外部变量】,是在block被释放时候才会被block释放。如view
 1 在block块里面的 【临时变量】,在block块执行时才会被引用   如strongSelf 、imageView
 2 在block块里面的 【临时变量】,在block块执行完成之后就会被释放  如strongSelf 、imageView
 3 使用strongSelf的意义在于 防止在异步线程中self已经被释放而导致strongSelf为空，在引用strongSelf方法导致崩溃的问题。

 具体解释：
 1、当block块没有被执行,Block不会引用里面【创建】的临时变量，所以不会导致循环引用问题，
 2、当block块刚好被执行,如果此时self已经被释放self=nil,则strongSelf=nil,所以block不能引用nil
 3、当block块刚好被执行,如果此时self没有被释放,则block引用StrongSelf,此时如果self接触对指向地址的引用,还有strongSelf引用这这块地址,所以这块地址不会被释放。
*/






/*
 0 声明一个变量,默认都是strong类型的
 1 对于函数中的临时变量，在函数执行完成就会失去对所指向的地址的引用
 2 对于用weak修饰的变量,在指向某个地址时并不会导致这块地址的引用计数+1
 3 静态变量保存在数据段当中,随着程序终止而释放。
 4 引用计数是针对内存地址来说的,而不是对指针引用计数+1(哈哈)
 */

/*
 
 UIView *view = [[UIView alloc] init];
 __weak typeof(self) weakSelf = self;
 myBlock = ^(){
 
 UIImageView *imageView = [[UIImageView alloc] init];
 __strong typeof(weakSelf) strongSelf = weakSelf;
 if (strongSelf) {
 [strongSelf description];
 }
 NSLog(@"%@",view);
 
 };
 
 0 对于那些被block引用的【外部变量】,是在block被释放时候才会被block释放。如view
 1 在block块里面的 【临时变量】,在block块执行时才会被引用   如strongSelf 、imageView
 2 在block块里面的 【临时变量】,在block块执行完成之后就会被释放  如strongSelf 、imageView
 3 使用strongSelf的意义在于 防止在异步线程中self已经被释放而导致strongSelf为空，在引用strongSelf方法导致崩溃的问题。
 具体解释：1、当block块没有被执行,Block不会引用里面【创建】的临时变量，所以不会导致循环引用问题，
 2、当block块刚好被执行,如果此时self已经被释放self=nil,则strongSelf=nil,所以block不能引用nil
 3、当block块刚好被执行,如果此时self没有被释放,则block引用StrongSelf,此时如果self接触对指向地址的引用,还有strongSelf引用这这块地址,所以这块地址不会被释放。
 */



@end
