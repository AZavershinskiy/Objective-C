//
//  Robot.m
//  IntermediateCertification
//
//  Created by Andrey Zavershinskiy on 22.01.2024.
//


#import "Robot.h"

@implementation Robot

- (instancetype)initWithName:(NSString *)name xCoordinate:(double)x yCoordinate:(double)y {
    self = [super init];
    if (self) {
        _name = name;
        _xCoordinate = x;
        _yCoordinate = y;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _name = [coder decodeObjectForKey:@"name"];
        _xCoordinate = [coder decodeDoubleForKey:@"xCoordinate"];
        _yCoordinate = [coder decodeDoubleForKey:@"yCoordinate"];
    }
    return  self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeDouble:_xCoordinate forKey:@"xCoordinate"];
    [coder encodeDouble:_yCoordinate forKey:@"yCoordinate"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
