//
//  Photographer.h
//  Seminar02
//
//  Created by Daniil Rassadin on 20/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CameraType) {
    CANON, NIKON
};

@interface Photographer : NSObject {
    @private CameraType _cameraType;
    @private NSInteger _startNumberOfPhoto;
    @private NSInteger _wage;
}

- (instancetype) initWithCameraType: (CameraType) cameraType;
- (instancetype) initWithCameraType: (CameraType) cameraType numberOfPhotos: (NSInteger) numberOfPhotos;
- (instancetype) initWithCameraType: (CameraType) cameraType numberOfPhotos: (NSInteger) numberOfPhotos wage: (NSInteger) wage;

- (CameraType) getCameraType;
- (void) setCameraType: (CameraType) cameraType;
- (NSInteger) getStartNumberOfPhoto;
- (void) setStartNumberOfPhoto: (NSInteger) photos;
- (NSInteger) getWage;
- (void) setWage: (NSInteger) wage;
- (void) checkMoney;

@end

NS_ASSUME_NONNULL_END
