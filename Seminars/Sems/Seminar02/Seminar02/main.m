//
//  main.m
//  Seminar02
//
//  Created by Daniil Rassadin on 20/12/23.
//

#import <Foundation/Foundation.h>
#import "Photographer.h"
#import "Trainer.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Photographer *vasya = [[Photographer alloc] initWithCameraType:NIKON numberOfPhotos:12];
//        Photographer *petya = [[Photographer alloc] initWithCameraType:CANON numberOfPhotos:10];
//        
//        [vasya checkMoney];
//        [petya checkMoney];
//        
//        Trainer *masha = [[Trainer alloc] initWithCameraType:NIKON numberOfPhotos:50];
//        
//        [masha checkMoney];
        
        Student *dasha = [[Student alloc] initWithName:@"Daria" surname:@"Pupkina" age:22];
        NSLog(@"%@", dasha);
        Student *glasha = dasha;
        [dasha increaseAge];
        NSLog(@"%@", dasha);
        NSLog(@"%@", glasha);
        
        Student *masha = [[Student alloc] init];
        Student *gosha = [Student new];
        NSLog(@"%@", masha);
        NSLog(@"%@", gosha);
    }
    return 0;
}
