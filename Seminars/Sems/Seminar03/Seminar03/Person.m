//
//  Person.m
//  Seminar03
//
//  Created by Daniil Rassadin on 21/12/23.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"%@ dealloc.", self.name);
}
@end
