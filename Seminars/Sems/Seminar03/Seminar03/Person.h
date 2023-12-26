//
//  Person.h
//  Seminar03
//
//  Created by Daniil Rassadin on 21/12/23.
//

#import <Foundation/Foundation.h>
#import "Passport.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) Passport *passport;
@end

NS_ASSUME_NONNULL_END
