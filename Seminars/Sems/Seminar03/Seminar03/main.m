//
//  main.m
//  Seminar03
//
//  Created by Daniil Rassadin on 21/12/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Passport.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *vasya = [Person new];
        Passport *passport1 = [Passport new];
        vasya.name = @"Vasya";
        vasya.passport = passport1;
        passport1.number = @"123456P";
        passport1.owner = vasya;
        NSLog(@"Finish.");
    }
    return 0;
}
