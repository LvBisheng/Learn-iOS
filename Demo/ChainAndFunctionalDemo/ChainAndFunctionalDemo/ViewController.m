//
//  ViewController.m
//  ChainAndFunctionalDemo
//
//  Created by lvibisheng on 2019/5/10.
//  Copyright © 2019 lbs. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ChainCaculator.h"
#import "FCaculatorMaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     链式编程思想：是将多个操作（多行代码）通过点号(.)链接在一起成为一句代码,使代码可读性好。add(1).add(2).add(3)
     链式编程特点：方法的返回值(例如add方法)是block,block必须有返回值（本身对象），block参数（需要操作的值）。例如CCaculatorManager add的方法。
     */
    NSInteger result = [NSObject makeCaculators:^(CCaculatorMaker * _Nonnull make) {
        make.add(1).add(2).add(3);
    }];
    NSLog(@"----------chain \n%zd", result);
    
    
    /*
     函数式编程思想：是把操作尽量写成一系列嵌套的函数或者方法调用。
     函数式编程特点：每个方法必须有返回值（本身对象）,把函数或者Block当做参数,block参数（需要操作的值）block返回值（操作结果）
     */
    //
    FCaculatorMaker *FMaker = [FCaculatorMaker new];
    // 拿来被比较的数
    NSInteger compareResult = 10;
    // 最开始的原始值
    FMaker.result = 4;
    [[FMaker calculate:^NSInteger(NSInteger currentResult) {
        // 在这里面做一系列操作
        currentResult += 1;
        currentResult += 2;
        currentResult += 3;
        return currentResult;
    }] equal:^BOOL(NSInteger result) {
        return result == compareResult;
    }];
    NSLog(@"----------funtional 最终结果:%zd; 是否等于%zd: %zd", FMaker.result, compareResult, FMaker.isEqual);
}


@end
