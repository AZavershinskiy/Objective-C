//
//  main.m
//  Example
//
//  Created by Семён Кривцов on 18.10.2023.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Teacher *teacher = [Teacher new];
        Student *student = [Student new];
        teacher.delegate = student;
        [teacher prepareHomework];
    }
    return 0;
}
