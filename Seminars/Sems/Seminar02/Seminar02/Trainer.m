//
//  Trainer.m
//  Seminar02
//
//  Created by Daniil Rassadin on 21/12/23.
//

#import "Trainer.h"

@implementation Trainer
- (void) checkMoney {
    NSInteger co = 2;
    NSLog(@"The photographer earned %li money.", [self getStartNumberOfPhoto] * co);
}

- (void) dealloc {
    NSLog(@"Dealloc trainer.");
}
@end
