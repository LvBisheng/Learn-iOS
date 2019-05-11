//
//  NSObject+ChainCaculator.m
//  ChainAndFunctionalDemo
//
//  Created by lvibisheng on 2019/5/10.
//  Copyright © 2019 lbs. All rights reserved.
//

#import "NSObject+ChainCaculator.h"

@implementation NSObject (ChainCaculator)

+ (NSInteger)makeCaculators:(void(^)(CCaculatorMaker *make))makeBlock {
    // 1.创建管理者
    CCaculatorMaker *maker = [CCaculatorMaker new];
    
    // 2.执行block返回该maker用于链式计算
    makeBlock(maker);
    
    return maker.result;
}
@end
