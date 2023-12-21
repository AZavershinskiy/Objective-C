//
//  Student.h
//  Seminar02
//
//  Created by Daniil Rassadin on 21/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
    @property (nonatomic, readonly) NSInteger age;
    @property (nonatomic) NSString *name, *surname, *fullName;

- (instancetype) initWithName: (NSString *) name surname: (NSString *) surname age: (NSInteger) age;
- (void) increaseAge;
@end

NS_ASSUME_NONNULL_END
