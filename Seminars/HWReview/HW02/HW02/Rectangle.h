//
//  Rectangle.h
//  HW02
//
//  Created by Andrey Zavershinskiy on 26.12.2023.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : Figure

@property (nonatomic) double height;
@property (nonatomic) double width;

- (instancetype)initWithWidth:(double)width height:(double)height;

@end

NS_ASSUME_NONNULL_END
