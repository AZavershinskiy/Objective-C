//
//  Photographer.m
//  Seminar02
//
//  Created by Daniil Rassadin on 20/12/23.
//

#import "Photographer.h"

@implementation Photographer

- (instancetype)initWithCameraType:(CameraType)cameraType {
    self = [super init];
    if (self) {
        _cameraType = cameraType;
        _startNumberOfPhoto = 0;
        _wage = 0;
    }
    return  self;
}

- (instancetype)initWithCameraType:(CameraType)cameraType numberOfPhotos:(NSInteger)numberOfPhotos {
    self = [super init];
    if (self) {
        _cameraType = cameraType;
        _startNumberOfPhoto = numberOfPhotos;
        _wage = 0;
    }
    return  self;
}

- (instancetype)initWithCameraType:(CameraType)cameraType numberOfPhotos:(NSInteger)numberOfPhotos wage:(NSInteger)wage {
    self = [super init];
    if (self) {
        _cameraType = cameraType;
        _startNumberOfPhoto = numberOfPhotos;
        _wage = wage;
    }
    return  self;
}

- (void)checkMoney {
    NSInteger co;
    switch (_cameraType) {
        case NIKON:
            co = 10;
            break;
        case CANON:
            co = 5;
            break;
    }
    NSLog(@"The photographer earned %li money.", (_startNumberOfPhoto * co));
}

- (CameraType)getCameraType {
    return  _cameraType;
}

- (void)setCameraType:(CameraType)cameraType {
    _cameraType = cameraType;
}

- (NSInteger)getStartNumberOfPhoto {
    return  _startNumberOfPhoto;
}

- (void)setStartNumberOfPhoto:(NSInteger)photos {
    _startNumberOfPhoto = photos;
}

- (NSInteger)getWage {
    return  _wage;
}

- (void)setWage:(NSInteger)wage {
    _wage = wage;
}

- (void)dealloc {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
