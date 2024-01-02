//
//  Doctor.h
//  HW03
//
//  Created by Andrey Zavershinskiy on 03.01.2024.
//

#import <Foundation/Foundation.h>
#import "DoctorDelegate.h"


NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject

@property (nonatomic, weak, nullable) id<DoctorDelegate> delegate;
- (void) givePill;

@end

NS_ASSUME_NONNULL_END
