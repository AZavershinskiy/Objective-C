//
//  Circle.m
//  HW02
//
//  Created by Andrey Zavershinskiy on 26.12.2023.
//

#import "Circle.h"

@implementation Circle

- (instancetype)initWithRadius:(double)radius {
	self = [super init];
	if (self) {
		_radius = radius;
	}
	return self;
}

- (double)calculateArea {
	return M_PI * self.radius * self.radius;
}

- (double)calculatePerimeter {
	return 2 * M_PI * self.radius;
}

- (void)printInfo {
	NSLog(@"Circle:");
	NSLog(@"Radius: %.2f", self.radius);
	NSLog(@"Area: %.2f", [self calculateArea]);
	NSLog(@"Perimeter: %.2f", [self calculatePerimeter]);
}

@end
