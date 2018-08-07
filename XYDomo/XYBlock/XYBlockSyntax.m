//
//  XYBlockSyntax.m
//  XYDomo
//
//  Created by wuxinyu on 2018/8/7.
//  Copyright © 2018年 xinyu.wu. All rights reserved.
//

#import "XYBlockSyntax.h"

@implementation XYBlockSyntax

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self testSyntax];
    }
    return self;
}

-(void)testSyntax
{
    int multiplier = 7;
    
    int (^myBlock)(int) = ^(int num){
        
        return num*multiplier;
    };
    
    printf("%d",myBlock(5));
    
    numberBlock numberBlock1 = ^(int number) {
        
        printf("%d",number);
    };
    
    [self getMoreCoins:numberBlock1];
    
    [self getMoreCoins:^(int number) {
        
        printf("%d",number);
        
    }];
    
    [self usedAsParamnent];
}

//cocoa中作为参数直接使用
-(void)usedAsParamnent
{
    NSArray *stringArray = [NSArray arrayWithObjects:@"string 1",@"string 21",@"string 12",@"string 11",@"string 02", nil];
    
    static NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch | NSNumericSearch | NSWidthInsensitiveSearch | NSForcedOrderingSearch;
    
    NSLocale *currentLocale = [NSLocale currentLocale];
    
    NSComparator finderSortBlock = ^(id string1, id string2) {
        
        NSRange stringRange = NSMakeRange(0, [string1 length]);
        
        return [string1 compare:string2 options:comparisonOptions range:stringRange locale:currentLocale];
    };
    
    NSArray *finderSortArray = [stringArray sortedArrayUsingComparator:finderSortBlock];
    
    NSLog(@"%@",finderSortArray);
    
    
    
}


-(NSArray *)testArray:(NSArray *)array Block:(NSComparator)comparator
{
    for (int i = 1; i < array.count; i++) {
        NSString *str0 = array[i - 1];
        NSString *str1 = array[i];
        
        NSComparisonResult result = comparator(str0,str1);
        
        if (result == NSOrderedAscending) {
            
        }else if (result == NSOrderedDescending) {
            
        }else {
            
        }
    }
    
    return array;
}

//-(NSInteger)compareNum:()

//作为参数直接使用
-(void)getMoreCoins:(void(^)(int))block
{
    block(3);
}

//单独作为函数使用--声明并实现一个block
typedef int (^myBlock)(int);
myBlock block = ^(int number){
    
    return number * 3;
    
};

myBlock block1 = ^(int number) {
    return number*5;
};

typedef void (^numberBlock)(int number);

@end
