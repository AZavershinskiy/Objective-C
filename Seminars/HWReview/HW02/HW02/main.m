//
//  main.m
//  HW02
//
//  Created by Andrey Zavershinskiy on 26.12.2023.
//

#import <Foundation/Foundation.h>
#import "Circle.h"
#import "Rectangle.h"
#import "Triangle.h"

/// Method for displaying information about an array of shapes
void printFiguresInfo(NSArray<Figure *> *figures) {
	for (Figure *figure in figures) {
		[figure printInfo];
		NSLog(@"----------");
	}
}

// MARK: - MAIN
int main(int argc, const char * argv[]) {
	@autoreleasepool {
		/// Creating an array with shapes
		NSMutableArray<Figure *> *figures = [NSMutableArray array];

		/// Adding Shapes to an Array
		Rectangle *rectangle = [[Rectangle alloc] initWithWidth:5.3 height:3.8];
		[figures addObject:rectangle];

		Circle *circle = [[Circle alloc] initWithRadius:4.5];
		[figures addObject:circle];

		Triangle *triangle = [[Triangle alloc] initWithSide1:3.5 side2:4.2 side3:5.1];
		[figures addObject:triangle];

		/// Displaying information about shapes
		printFiguresInfo(figures);
	}
	return 0;
}
