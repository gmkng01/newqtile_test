// #include <stdio.h>

// int main(void)
// {
//     printf("Hello, world\n");
//     printf("My name is Abhishek");

//     int x;                      // Declaration
//     x = 123;                    // Initialization
//     int y = 456;                // Declaration + Initialization

//     int age = 21;               // Integer
//     float gpa = 3.44;           // Floating point number
//     char grade = 'A';           // Single character
//     char name[] = "Abhishek";   // Array of characters

//     printf("hello %s\n", name);
//     printf("You are %d years old\n", age);
//     printf("Your averge grade is %c \n", grade);
//     printf("Your gpa is %f\n", gpa);

//     return 0;
// }

#include <stdio.h>
// #include <string.h>
int main() {
    printf("Size of int: %zu bytes\n", sizeof(int));
    printf("Size of char: %zu byte\n", sizeof(char));
    printf("Size of float: %zu bytes\n", sizeof(float));
    return 0;
}

