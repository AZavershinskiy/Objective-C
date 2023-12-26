//
//  Passport.h
//  Seminar03
//
//  Created by Daniil Rassadin on 21/12/23.
//

#import <Foundation/Foundation.h>
@class Person;

NS_ASSUME_NONNULL_BEGIN

@interface Passport : NSObject
@property (nonatomic) NSString *number;
@property (nonatomic, weak) Person *owner;
@end

NS_ASSUME_NONNULL_END
