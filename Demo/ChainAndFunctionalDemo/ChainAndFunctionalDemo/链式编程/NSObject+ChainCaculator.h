//
//  NSObject+ChainCaculator.h
//  ChainAndFunctionalDemo
//
//  Created by lvibisheng on 2019/5/10.
//  Copyright © 2019 lbs. All rights reserved.
//  参考文章 https://www.jianshu.com/p/dc546eb18af3

#import <Foundation/Foundation.h>
#import "CCaculatorMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ChainCaculator)

+ (NSInteger)makeCaculators:(void(^)(CCaculatorMaker *make))makeBlock;

@end

NS_ASSUME_NONNULL_END
