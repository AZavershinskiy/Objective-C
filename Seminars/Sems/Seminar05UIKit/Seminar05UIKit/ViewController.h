//
//  ViewController.h
//  Seminar05UIKit
//
//  Created by Daniil Rassadin on 13/1/24.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) Loader *loader;

- (void)performLoadingForGetRequest;
- (void)performLoadingForPostRequest;

@end

