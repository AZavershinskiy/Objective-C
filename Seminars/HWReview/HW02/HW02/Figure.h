//
//  Figure.h
//  HW02
//
//  Created by Andrey Zavershinskiy on 26.12.2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Figure : NSObject

- (double)calculateArea;
- (double)calculatePerimeter;
- (void)printInfo;

@end

NS_ASSUME_NONNULL_END
