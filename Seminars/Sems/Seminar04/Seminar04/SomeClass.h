//
//  SomeClass.h
//  Seminar04
//
//  Created by Daniil Rassadin on 9/1/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SomeClass : NSObject
@property (nonatomic, nullable, copy) int (^block)(int, int);

- (void) printResultOFA: (int) a b: (int) b block: (int(^)(int, int)) block;
@end

NS_ASSUME_NONNULL_END
