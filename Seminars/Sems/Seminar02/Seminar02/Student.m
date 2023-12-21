//
//  Student.m
//  Seminar02
//
//  Created by Daniil Rassadin on 21/12/23.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name surname:(NSString *)surname age:(NSInteger)age {
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
        _age = age;
    }
    return self;
}

- (NSString *) fullName {
    return [[self.name stringByAppendingString:@" "] stringByAppendingString:self.surname];
}

- (void) increaseAge {
    _age++;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Name: %@, surname: %@, %li years old", self.name, self.surname, [self age]];
}

@end
