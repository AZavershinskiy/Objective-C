//
//  ColorTile.h
//  Persistance
//
//  Created by Daniil Rassadin on 16/1/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorTile : NSObject<NSCoding>

@property (nonatomic) UIColor *tileColor;
@property (nonatomic) CGPoint tileOrigin;

-(instancetype)initWithColor: (UIColor *) color andPoint: (CGPoint) point;

@end

NS_ASSUME_NONNULL_END
