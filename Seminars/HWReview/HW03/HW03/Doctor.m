//
//  Doctor.m
//  HW03
//
//  Created by Andrey Zavershinskiy on 03.01.2024.
//

#import "Doctor.h"

@implementation Doctor

- (void) givePill {
	NSLog(@"The doctor gave the patient a pill");
	[self.delegate takePill];
}

@end
