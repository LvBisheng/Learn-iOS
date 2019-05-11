//
//  FCaculatorMaker.h
//  ChainAndFunctionalDemo
//
//  Created by lvibisheng on 2019/5/11.
//  Copyright © 2019 lbs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCaculatorMaker : NSObject

@property (nonatomic, assign, readonly) NSInteger isEqual;

@property (nonatomic, assign) NSInteger result;

/**
 计算
 */
- (FCaculatorMaker *)calculate:(NSInteger(^)(NSInteger))calculateBlock;


/**
 是否相等
 */
- (FCaculatorMaker *)equal:(BOOL(^)(NSInteger))operation;

@end

NS_ASSUME_NONNULL_END
