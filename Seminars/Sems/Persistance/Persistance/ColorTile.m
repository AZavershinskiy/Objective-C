//
//  ColorTile.m
//  Persistance
//
//  Created by Daniil Rassadin on 16/1/24.
//

#import "ColorTile.h"

@implementation ColorTile

-(instancetype)initWithColor: (UIColor *) color andPoint: (CGPoint) point {
    self = [super init];
    if (self) {
        self.tileColor = color;
        self.tileOrigin = point;
    }
    return  self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.tileColor = [coder decodeObjectForKey:@"tileColor"];
        float x = [coder decodeFloatForKey:@"xCoord"];
        float y = [coder decodeFloatForKey:@"yCoord"];
        self.tileOrigin = CGPointMake(x, y);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.tileColor forKey:@"tileColor"];
    [coder encodeFloat:self.tileOrigin.x forKey:@"xCoord"];
    [coder encodeFloat:self.tileOrigin.y forKey:@"yCoord"];
}

@end
