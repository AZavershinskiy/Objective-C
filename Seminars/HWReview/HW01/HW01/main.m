//
//  task01.m
//  HW01
//
//  Created by Andrey Zavershinskiy on 18.12.2023.

#import <Foundation/Foundation.h>

// MARK: Method for #Task01
void quadraticEquation(double a, double b, double c) {
	double discriminant = b * b  - 4 * a * c;
	if (discriminant > 0) {
		double x1 = (-b - sqrt(discriminant)) / (2 * a);
		double x2 = (-b + sqrt(discriminant)) / (2 * a);
		NSLog(@"Уравнение имеет два корня: x1 = %.2f, x2 = %.2f", x1, x2);
	} else if (discriminant == 0) {
		double x = -b / (2 * a);
		NSLog(@"Уравнение имеет один корень: x = %.2f", x);
	} else {
		NSLog(@"Уравнение не имеет действительных решений");
	}
}

// MARK: Method for #Task02
double findMaxNumber(double num1, double num2, double num3) {
	double maxNumber = num1;
	if (num2 > maxNumber) {
		maxNumber = num2;
	}
	if (num3 > maxNumber) {
		maxNumber = num3;
	}
	return maxNumber;
}

int main(int argc, const char * argv[]) {
	@autoreleasepool {

		// MARK: - #Task01
		///
		/// Решить квадратные уравнения:
		/// x^2 – 8x + 12 = 0,
		/// 12x^2 – 4x + 2 = 0,
		/// x^2 – 100x - 2 = 0
		/// (заменять константы в коде).
		///
		NSLog(@"Task01:");
		NSLog(@"x^2 – 8x + 12 = 0");
		quadraticEquation(1, -8, 12);

		NSLog(@"12x^2 – 4x + 2 = 0");
		quadraticEquation(12, -4, 2);

		NSLog(@"x^2 – 100x - 2 = 0");
		quadraticEquation(1, -100, -2);
		NSLog(@"----------");

		// MARK: - #Task02
		///
		/// Создать программу, которая находит большее число среди 3-х чисел
		///
		NSLog(@"Task02:");
		double num1, num2, num3;

		NSLog(@"Введите первое число:");
		scanf("%lf", &num1);
		NSLog(@"Введите второе число:");
		scanf("%lf", &num2);
		NSLog(@"Введите третье число:");
		scanf("%lf", &num3);

		NSLog(@"Наибольшее число: %.2f", findMaxNumber(num1, num2, num3));
	}
	return 0;
}
