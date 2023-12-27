//
//  Circle.h
//  HW02
//
//  Created by Andrey Zavershinskiy on 26.12.2023.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Circle : Figure

@property (nonatomic) double radius;

- (instancetype)initWithRadius:(double)radius;

@end

NS_ASSUME_NONNULL_END
