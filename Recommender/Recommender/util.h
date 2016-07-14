#ifndef UTIL_H_
#define UTIL_H_

#include <vector>
#include <ctime>
#include <cmath>
#include <cfloat>
#include <iostream>
#include <fstream>

using std::string;
using std::vector;
using std::ifstream;

typedef unsigned int uint;

/*
* Summary: calculate square
* Parameters:
*	d: a double type number
* Return : the square of d
*/
inline double sqr(double d) { return d * d; }

/*
* Summary: A bounded differentiable real function that
*			is defined for all real input values and has
*			a positive derivative at each point.
* Wikipedia: https://en.wikipedia.org/wiki/Sigmoid_function
* Parameters:
*	d: a double type number
* Return : 1 / (1 + e^(-d))
*/
inline double sigmoid(double d) { return (double)1.0 / (1.0 + exp(-d)); }

/*
* Summary: tokenize the input string
* Parameters:
*	str: string to be tokenize d
*	delimiter: delimiter to split string
* Return: a vector object contains tokens splited by delimiter
*/
vector<string> tokenize(const string& str, const string& delimiter) {
	vector<string> result;
	auto lastPos = str.find_first_not_of(delimiter);
	auto pos = str.find_first_of(delimiter, lastPos);

	while (string::npos != pos || string::npos != lastPos) {
		result.push_back(str.substr(lastPos, pos - lastPos));
		lastPos = str.find_first_not_of(delimiter, pos);
		pos = str.find_first_of(delimiter, lastPos);
	}
	return result;
}

/*
* Summary: get the processor time consumed by the program
* Parameters:
*	None
* Return: the processor time consumed by the program
*/
double get_user_time() {
	return (double)clock() / CLOCKS_PER_SEC;
}

/*
* Summary: judge if the filename exists
* Parameters:
*	None
* Return: true if file exists, false otherwise
*/
bool file_exists(string filename) {
	ifstream fin(filename.c_str());
	return fin.is_open();
}


#endif /*UTIL_H_*/
