#include <iostream>
#include <cmath>
#include "functions.h"
/**
 * Very basic implementation of main math operations
 * @param  argc Number of command line arguments
 * @param  argv User command line values,
 * @return      Return of x "op" y, where "op" is last
 * command line argument provided by the user: "+","-","/","*"
 * USAGE: ./math 10 5.0 "*"
 */
int main(int argc, char const *argv[])
{
	std::cout << "Let's make some math! :)" << std::endl;
	double x = 10.0, y = 5.0;
	if (argc > 1) // Use values passed by command line arg.
	{
		x = atof(argv[1]);
		y = atof(argv[2]);
		char const *op = argv[3];
		// Print result depending on the operator
		std::cout << x << op << y << " = ";
		switch (*op)
		{
		   case '+': 
		       std::cout << sum(x,y) << std::endl;
		       break;
		   case '-': 
		       std::cout << sub(x,y) << std::endl;
		       break;
		   case '*':
		       std::cout << mul(x,y) << std::endl;
		       break;
		   case '/':
		       std::cout << divi(x,y) << std::endl;
		       break;
		   default:
		       std::cout << sum(x,y) << std::endl;
		}
	} else {
		std::cout << x << "+" << y << " = ";
		std::cout << sum(x,y) << std::endl;
		std::cout << x << "-" << y << " = ";
		std::cout << sub(x,y) << std::endl;
		std::cout << x << "*" << y << " = ";
		std::cout << mul(x,y) << std::endl;
		std::cout << x << "/" << y << " = ";
		std::cout << divi(x,y) << std::endl;
	}
	return 0;
} 