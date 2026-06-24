#include <iostream>

int main() {
    std::cout << "Hello from C++!" << std::endl;
    std::cout << "Enter a number: ";
    int number;
    if (std::cin >> number) {
        std::cout << "You entered: " << number << std::endl;
        std::cout << "Square is: " << (number * number) << std::endl;
    } else {
        std::cout << "No valid number entered." << std::endl;
    }
    return 0;
}
