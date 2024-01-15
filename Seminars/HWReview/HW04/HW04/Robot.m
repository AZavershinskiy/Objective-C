//
//  Robot.m
//  HW04
//
//  Created by Andrey Zavershinskiy on 14.01.2024.
//

#import "Robot.h"

@implementation Robot

- (instancetype)init {
	self = [super init];
	if (self) {
		_x = 0;
		_y = 0;
	}
	return self;
}

- (void)run:(NSString * (^)(void))block {
	NSString *direction = block();

	if ([direction isEqualToString:@"up"]) {
		self.y += 1;
		NSLog(@"Robot location: (%d, %d)", (int)_x, (int)_y);
	} else if ([direction isEqualToString:@"down"]) {
		self.y -= 1;
		NSLog(@"Robot location: (%d, %d)",(int)_x, (int)_y);
	} else if ([direction isEqualToString:@"left"]) {
		self.x -= 1;
		NSLog(@"Robot location: (%d, %d)", (int)_x, (int)_y);
	} else if ([direction isEqualToString:@"right"]) {
		self.x += 1;
		NSLog(@"Robot location: (%d, %d)", (int)_x, (int)_y);
	}
}
@end
