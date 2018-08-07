//
//  XYTypeCViewController.m
//  XYDomo
//
//  Created by wuxinyu on 2018/8/7.
//  Copyright © 2018年 xinyu.wu. All rights reserved.
//

#import "XYTypeCViewController.h"

@interface XYTypeCViewController ()

@end

@implementation XYTypeCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self simpleConst];
    
//    [self const_Int_xpa];
    
//    [self int_x_const_pa];
    
//    [self passParamnenter];
    
//    [self findCharaterInString];
    
    NSString *oldString = @"old";
    [self changeSrings:&oldString];
    NSLog(@"%@",oldString);
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

-(void)changeSrings:(NSString **)string
{
    /*
     *NSString *string = oldString;
     */
    
    *string = @"new";
}

-(void)findCharaterInString
{
    char str[] = {"afsdfsdsdk\0"};
    
    char a = 'd';
    
    char *p = 0;
    
    find1(str, a, &p);
    
    if (p == 0) {
        
        printf("没有取到");
        
    }else{
        
        printf("\n%s",p);
        
    }
}

void find1(char array[], char search, char **pa)
{
    for (int i = 0; *(array + i) != 0; i++) {
        
        printf("\n%c",array[i]);
        char s = *(array + i);
        
        if (s == search) {
            
            *pa = array + i;
            
            break;
            
        }else if (*(array + i) == 0) {
            
            pa = 0;
        }
    }
}

//参数传递
-(void)passParamnenter
{
    int x = 4, y = 6;
    exchange(x,y);
    exchange1(&x, &y);
    printf("\nx = %d and y = %d",x,y);
}

//值传递
void exchange(int x, int y)
{
    int temp = x;
    
    x = y;
    
    y = temp;
    
    printf("\nx = %d and y = %d",x,y);
}

//指针传递
void exchange1(int * x, int * y)
{
    int temp = *x;
    
    *x = *y;
    
    *y = temp;
    
    printf("\nx = %d and y = %d",*x,*y);
}

-(void)simpleConst
{
    int const i = 10; //等同于const int i = i;
    
    
    int *pa;
    
    pa = (int *)&i;
    
    printf("\npa = %d",*pa);
    
    *pa = 5;
    
    printf("\npa = %d",*pa);
    printf("\ni = %d",i);
    
    /* 用const修饰的常量 值不能再修改
     i = 11;
     j = 21;
     */
}

// const int *pa
-(void)const_Int_xpa
{
    int i = 11 , j = 12;
    
    const int *pa;
    
    pa = &i;
    
    printf("\n*pa = %d",*pa);
    
    pa = &j;
    
    printf("\n*pa = %d",*pa);
    // *pa = 10; const 修饰*pa, 所以*pa不能再重新赋值
    
    j = 22;
    
    printf("\n*pa = %d",*pa);
}

// int * const pa
-(void)int_x_const_pa
{
    int i = 11;
    
    int * const pi = &i;
    
    // pi = &i; const 修饰pi, 所以pi不能再重新赋值
    
    i = 33;
    
    printf("\n*pi = %d",*pi);
    
    *pi = 55;
    
    printf("\ni = %d",i);
}


@end
