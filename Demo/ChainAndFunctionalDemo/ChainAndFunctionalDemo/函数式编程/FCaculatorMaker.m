//
//  FCaculatorMaker.m
//  ChainAndFunctionalDemo
//
//  Created by lvibisheng on 2019/5/11.
//  Copyright © 2019 lbs. All rights reserved.
//

#import "FCaculatorMaker.h"

@interface FCaculatorMaker ()

@property (nonatomic, assign) NSInteger isEqual;

@end

@implementation FCaculatorMaker

- (FCaculatorMaker *)calculate:(NSInteger (^)(NSInteger))calculateBlock {
    // 调用block把需要操作的值抛出去
    _result = calculateBlock(self.result);
    return self;
}

- (FCaculatorMaker *)equal:(BOOL (^)(NSInteger))operation {
    // 把当前的result传出去做比较
    _isEqual = operation(self.result);
    return self;
}
@end
