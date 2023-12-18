//
//  main.m
//  Seminar01
//
//  Created by Daniil Rassadin on 14/12/23.
//

#import <Foundation/Foundation.h>

bool alphabetContains(NSString *character) {
	int code = [character characterAtIndex:0];
	return code >= 65 && code <= 122;
}

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		//        Создаем новый проект. Выбираем и объявляем переменную, которая будет хранить значение, квадрат числа которого будет вычисляться. Затем производим расчет и выводим результат в лог
		//        int a = 2;
		//        a *= a;
		//        NSLog(@"%i", a);

		//        Дано некоторое сопоставление имени и числа. Для более корректного отображения такой информации необходимо вывести ее одной строкой в консоль. Создадим 3 переменные с необходимыми значениями
		//        int b = 8, c = 16;
		//        NSLog(@"a = %i, b = %i, c = %i", a, b, c);

		//        Для создания такой программы используем возможности языка C. Для получения введенного числа применим функцию scanf(). Сначала создадим переменные, в которых будут храниться введенные значения
		//        int d, f, g;
		//        scanf("%d", &d);
		//        scanf("%d", &f);
		//        scanf("%d", &g);
		//
		//        NSLog(@"%i", d + f + g);

		//        Создать программу калькулятор, которая будет применять к введенным числам различные арифметические операции, такие как сложение, вычитание, умножение, деление, среднее арифметическое
		//        int h, i;
		//        scanf("%d", &h);
		//        scanf("%d", &i);
		//        NSLog(@"%i + %i = %i", h, i, h + i);
		//        NSLog(@"%i - %i = %i", h, i, h - i);
		//        NSLog(@"%i * %i = %i", h, i, h * i);
		//        NSLog(@"%i / %i = %f", h, i, (double)h / (double)i);
		//        NSLog(@"%i %% %i = %i", h, i, h % i);
		//        NSLog(@"+ is %i\n- is %i\n* is %i\n\\ is %i\n%% is %i", h + i, h - i, h * i, h / i, h % i);

		//        Создание функции, которая будет проверять, входит ли переданная буква в английский алфавит
		//        NSLog(@"%d", alphabetContains(@"8"));

		//        Создать программу, которая будет выводить список введенных пользователем значений циклами for, while и do-while
		char array[10];
		scanf("%s", array);
		NSString *string = [NSString stringWithCString:array encoding:NSUTF8StringEncoding];
		//        for (int i = 0; i < string.length; i++) {
		//            NSLog(@"%c", [string characterAtIndex:i]);
		//        }
		int i = 0;
		//        while (i < string.length) {
		//            NSLog(@"%c", [string characterAtIndex:i]);
		//            i++;
		//        }
		do {
			NSLog(@"%c", [string characterAtIndex:i]);
			i++;
		} while (i < string.length);
	}
	return 0;
}
