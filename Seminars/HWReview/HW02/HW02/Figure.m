//
//  Figure.m
//  HW02
//
//  Created by Andrey Zavershinskiy on 26.12.2023.
//

#import "Figure.h"

@implementation Figure

// MARK: - Default methods to mimic abstract methods
- (double)calculateArea {
	return 0.0;
}

- (double)calculatePerimeter {
	return 0.0;
}

- (void)printInfo {
	NSLog(@"This is an abstract figure");
}

@end
