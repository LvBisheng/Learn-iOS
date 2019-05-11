//
//  CCaculatorMaker.h
//  ChainAndFunctionalDemo
//
//  Created by lvibisheng on 2019/5/10.
//  Copyright © 2019 lbs. All rights reserved.
//   链式编程特点：方法的返回值是block,block必须有返回值（本身对象），block参数（需要操作的值）。例如CCaculatorManager add的方法。

#import <Foundation/Foundation.h>

@class CCaculatorMaker;
// CCaculatorManagerReturnBlock有返回值CCaculatorManager对象，参数为需要操作的数
typedef CCaculatorMaker *_Nonnull(^CCaculatorManagerReturnBlock)(NSInteger);

NS_ASSUME_NONNULL_BEGIN

@interface CCaculatorMaker : NSObject

/** 结果值 */
@property (nonatomic, assign, readonly) NSInteger result;

/**
 加方法
 @return 返回block
 */
- (CCaculatorManagerReturnBlock)add;

@end

NS_ASSUME_NONNULL_END
