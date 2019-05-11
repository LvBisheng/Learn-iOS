//
//  CCaculatorMaker.m
//  ChainAndFunctionalDemo
//
//  Created by lvibisheng on 2019/5/10.
//  Copyright © 2019 lbs. All rights reserved.
//

#import "CCaculatorMaker.h"

@interface CCaculatorMaker ()

@property (nonatomic, assign) NSInteger result;

@end
@implementation CCaculatorMaker

- (CCaculatorManagerReturnBlock)add {
    __weak typeof(self) weakSelf = self;
    return ^(NSInteger value){
        weakSelf.result += value;
        return self;
    };
}

@end
