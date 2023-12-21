//
//  Teacher.m
//  Example
//
//  Created by Семён Кривцов on 18.10.2023.
//

#import "Teacher.h"

@implementation Teacher

- (void)prepareHomework {
    NSLog(@"Teacher preparing homework");
    [self.delegate doHomework];
}

@end
