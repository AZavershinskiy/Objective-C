//
//  ViewController.m
//  Persistance
//
//  Created by Daniil Rassadin on 16/1/24.
//

#import "ViewController.h"

@interface ViewController ()

- (void)resetDefaults;

@property (strong, nonatomic) NSUserDefaults *userDefaults;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
//    [self.userDefaults setInteger:42 forKey:@"forty-two"];
//    [self.userDefaults setDouble:2.71828182459045 forKey:@"two.seven"];
//    [self.userDefaults setFloat:3.14 forKey:@"three.fourteenfour"];
//    [self.userDefaults setObject:@"Hello, world!" forKey:@"hello"];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    CGPoint point = CGPointMake(10, 10);
//    UIColor *pointColor = [UIColor systemRedColor];
//    ColorTile *tile = [[ColorTile alloc] initWithColor:pointColor andPoint:point];
//    NSData *tileData = [NSKeyedArchiver archivedDataWithRootObject:tile requiringSecureCoding:NO error:nil];
//    [self.userDefaults setObject:tileData forKey:@"tile"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *path = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
//    NSLog(@"%@", [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]);
    NSURL *folderPath = [path URLByAppendingPathComponent:@"newFolder"];
    NSURL *pathToData = [folderPath URLByAppendingPathComponent:@"data.txt"];
    NSData *data = [@"String for file." dataUsingEncoding:kCFStringEncodingUTF8];
    if ([fileManager createDirectoryAtURL:folderPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        [fileManager createFileAtPath:pathToData.path contents:data attributes:nil];
    }
    if ([fileManager fileExistsAtPath:pathToData.path]) {
        NSData *savedData = [fileManager contentsAtPath:pathToData.path];
        NSString *string = [[NSString alloc] initWithData:savedData encoding:kCFStringEncodingUTF8];
        NSLog(@"%@", string);
        [fileManager removeItemAtPath:pathToData.path error:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSString *myString = [self.userDefaults stringForKey:@"hello"];
//    NSLog(@"%@", myString);
//    NSInteger myInt = [self.userDefaults integerForKey:@"forty-two"];
//    NSLog(@"%li", myInt);
//    double myDouble = [self.userDefaults doubleForKey:@"two.seven"];
//    NSLog(@"%f", myDouble);
//    float myFloat = [self.userDefaults floatForKey:@"three.fourteenfour"];
//    NSLog(@"%f", myFloat);
//    [self resetDefaults];
//    NSData *tileData = [self.userDefaults objectForKey:@"tile"];
//    ColorTile *tileObj = [NSKeyedUnarchiver unarchivedObjectOfClass:ColorTile.self fromData:tileData error:nil];
//    ColorTile *tileObj = [NSKeyedUnarchiver unarchiveObjectWithData:tileData];
//    NSLog(@"%@", tileObj.tileColor);
}


- (void)resetDefaults {
    NSDictionary *dict = [self.userDefaults dictionaryRepresentation];
    for (NSString *key in dict) {
        [self.userDefaults removeObjectForKey:key];
    }
    [self.userDefaults synchronize];
}

@end
