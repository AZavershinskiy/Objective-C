//
//  Triangle.h
//  HW02
//
//  Created by Andrey Zavershinskiy on 26.12.2023.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Triangle : Figure

@property (nonatomic, assign) double side1;
@property (nonatomic, assign) double side2;
@property (nonatomic, assign) double side3;

- (instancetype)initWithSide1:(double)side1 side2:(double)side2 side3:(double)side3;

@end

NS_ASSUME_NONNULL_END
