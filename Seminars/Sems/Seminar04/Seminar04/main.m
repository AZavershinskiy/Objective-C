//
//  main.m
//  Seminar04
//
//  Created by Daniil Rassadin on 9/1/24.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"

typedef int (^TwoNumbersBlock)(int, int);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TwoNumbersBlock sumOfTwoNumbers = ^int(int a, int b) {
            return a + b;
        };
        
//        NSLog(@"%d", sumOfTwoNumbers(3, 7));
        
        SomeClass *someClass = [SomeClass new];
        someClass.block = sumOfTwoNumbers;
//        NSLog(@"%d", someClass.block(3, 7));
        
        someClass.block = ^int(int a, int b) {
            return a - b;
        };
//        NSLog(@"%d", someClass.block(3, 7));
        
        [someClass printResultOFA:20 b:5 block:sumOfTwoNumbers];
        [someClass printResultOFA:20 b:5 block:someClass.block];
    }
    return 0;
}
