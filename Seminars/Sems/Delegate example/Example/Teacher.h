//
//  Teacher.h
//  Example
//
//  Created by Семён Кривцов on 18.10.2023.
//

#import <Foundation/Foundation.h>
#import "TeacherDelegate.h"
#import "Student.h"
NS_ASSUME_NONNULL_BEGIN

@interface Teacher : NSObject

@property (nonatomic, weak, nullable) id<TeacherDelegate> delegate;
- (void) prepareHomework;

@end

NS_ASSUME_NONNULL_END
