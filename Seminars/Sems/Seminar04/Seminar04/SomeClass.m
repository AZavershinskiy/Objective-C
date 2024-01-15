//
//  SomeClass.m
//  Seminar04
//
//  Created by Daniil Rassadin on 9/1/24.
//

#import "SomeClass.h"

@implementation SomeClass

- (void)printResultOFA:(int)a b:(int)b block:(nonnull int (^)(int, int))block {
    NSLog(@"%d", block(a, b));
}

@end
