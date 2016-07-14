// matrix.h: Dense Matrix and Vectors

#ifndef MATRIX_H_
#define MATRIX_H_

#include <vector>
#include <cassert>
#include <iostream>
#include <fstream>
#include "memory.h"
#include "random.h"

using std::string;
using std::vector;
using std::ifstream;
using std::ofstream;
using std::cout;
using std::endl;

typedef unsigned int uint;

const uint DVECTOR_EXPECTED_FILE_ID = 1;
const uint DMATRIX_EXPECTED_FILE_ID = 1001;

struct dmatrix_file_header {
	uint id;
	uint type_size;
	uint num_rows;
	uint num_cols;
};

/*
* Dense Matrix.
*/
template <typename T>
class DMatrix {
public:
	T** value;
	vector<string> col_names;
	uint dim1, dim2;

	T get(uint x, uint y) {
		//assert((x < dim1) && (y < dim2));
		return value[x][y];
	}

	DMatrix(uint p_dim1, uint p_dim2) {
		dim1 = 0;
		dim2 = 0;
		value = nullptr;
		setSize(p_dim1, p_dim2);
	}

	DMatrix() {
		dim1 = 0;
		dim2 = 0;
		value = nullptr;
	}

	~DMatrix() {
		if (value != nullptr) {
			for (uint i = 0; i < dim1; i++) {
				//MemoryLog::getInstance().log_free("dmatrix", sizeof(T*), dim1);
				delete[] value[i];
			}
			/*//MemoryLog::getInstance().log_free("dmatrix", sizeof(T*), dim1);
			delete[] value[0];*/
			//MemoryLog::getInstance().log_free("dmatrix", sizeof(T), dim1 * dim2);
			delete[] value;
		}
	}

	void assign(DMatrix<T>& v) {
		if ((v.dim1 != dim1) || (v.dim2 != dim2)) { setSize(v.dim1, v.dim2); }
		for (auto i = 0; i < dim1; i++) {
			for (auto j = 0; j < dim2; j++) {
				value[i][j] = v.value[i][j];
			}
		}
	}

	void init(T v) {
		for (uint i = 0; i < dim1; i++) {
			for (uint i2 = 0; i2 < dim2; i2++) {
				value[i][i2] = v;
			}
		}
	}
	/* Heap consists of separate memory block, consecutive allocation may cause heap overflow */
	void setSize(uint p_dim1, uint p_dim2) {
		if ((p_dim1 == dim1) && (p_dim2 == dim2)) {
			return;
		}
		if (value != nullptr) {
			for (uint i = 0; i < dim1; i++) {
				//MemoryLog::getInstance().log_free("dmatrix", sizeof(T*), dim1);
				delete[] value[i];
			}
			/*//MemoryLog::getInstance().log_free("dmatrix", sizeof(T*), dim1);
			delete[] value[0];*/
			//MemoryLog::getInstance().log_free("dmatrix", sizeof(T), dim1 * dim2);
			delete[] value;
		}
		dim1 = p_dim1;
		dim2 = p_dim2;
		//MemoryLog::getInstance().log_new("dmatrix", sizeof(T*), dim1);
		value = new T*[dim1];
		//MemoryLog::getInstance().log_new("dmatrix", sizeof(T), dim1 * dim2);
		for (uint i = 0; i < dim1; i++) {
			value[i] = new T[dim2];
		}

		col_names.resize(dim2);
		for (uint i = 1; i < dim2; i++) {
			col_names[i] = "";
		}
	}

	T& operator() (unsigned x, unsigned y) {
		//	assert((x < dim1) && (y < dim2));
		return value[x][y];
	}
	T operator() (unsigned x, unsigned y) const {
		//	assert((x < dim1) && (y < dim2));
		return value[x][y];
	}

	T* operator() (unsigned x) const {
		//	assert((x < dim1));
		return value[x];
	}

	/*void save(string filename, bool has_header = false) {
		ofstream fout(filename.c_str());
		if (fout.is_open()) {
			if (has_header) {
				for (uint i_2 = 0; i_2 < dim2; i_2++) {
					if (i_2 > 0) {
						fout << "\t";
					}
					fout << col_names[i_2];
				}
				fout << endl;
			}
			for (uint i_1 = 0; i_1 < dim1; i_1++) {
				for (uint i_2 = 0; i_2 < dim2; i_2++) {
					if (i_2 > 0) {
						fout << "\t";
					}
					fout << value[i_1][i_2];
				}
				fout << endl;
			}
			fout.close();
		} else {
			cout << "Unable to open file " << filename;
		}
	}

	void load(string filename) {
		ifstream fin(filename.c_str());
		if (!fin.is_open()) {
			throw "Unable to open file " + filename;
		}
		for (uint i_1 = 0; i_1 < dim1; i_1++) {
			for (uint i_2 = 0; i_2 < dim2; i_2++) {
				T v;
				fin >> v;
				value[i_1][i_2] = v;
			}
		}
		fin.close();
	}*/

};

template <typename T>
class DVector {
public:
	uint dim;
	T* value;

	DVector() {
		dim = 0;
		value = nullptr;
	}

	DVector(uint p_dim) {
		dim = 0;
		value = nullptr;
		setSize(p_dim);
	}

	~DVector() {
		if (value != nullptr) {
			//MemoryLog::getInstance().log_free("dvector", sizeof(T), dim);
			delete[] value;
		}
	}

	T get(uint x) {
		return value[x];
	}

	void setSize(uint p_dim) {
		if (p_dim == dim) { 
			return; 
		}
		if (value != nullptr) {
			//MemoryLog::getInstance().log_free("dvector", sizeof(T), dim);
			delete[] value;
		}
		dim = p_dim;
		//MemoryLog::getInstance().log_new("dvector", sizeof(T), dim);
		value = new T[dim];
	}

	T& operator() (unsigned x) {
		return value[x];
	}

	T operator() (unsigned x) const {
		return value[x];
	}

	void init(const T &v) {
		for (uint i = 0; i < dim; i++) {
			value[i] = v;
		}
	}

	void assign(const T* const v) {
		if (v->dim != dim) {
			setSize(v->dim);
		}
		for (auto i = 0; i < dim; i++) {
			value[i] = v[i];
		}
	}

	void assign(DVector<T>& v) {
		if (v.dim != dim) { setSize(v.dim); }
		for (auto i = 0; i < dim; i++) {
			value[i] = v.value[i];
		}
	}

	void save(string filename) {
		ofstream fout(filename.c_str());
		if (fout.is_open()) {
			for (uint i = 0; i < dim; i++) {
				fout << value[i] << endl;
			}
			fout.close();
		} else {
			cout << "Unable to open file " << filename;
		}
	}

	void load(string filename) {
		ifstream fin(filename.c_str());
		if (!fin.is_open()) {
			throw "Unable to open file " + filename;
		}
		for (uint i = 0; i < dim; i++) {
			T v;
			fin >> v;
			value[i] = v;
		}
		fin.close();
	}
};


class DVectorDouble : public DVector<double> {
public:
	void init_normal(double mean, double stdev) {
		for (uint i_2 = 0; i_2 < dim; i_2++) {
			value[i_2] = ran_gaussian(mean, stdev);
		}
	}
};

class DMatrixDouble : public DMatrix<double> {
public:
	void init(double mean, double stdev) {
		for (uint i_1 = 0; i_1 < dim1; i_1++) {
			for (uint i_2 = 0; i_2 < dim2; i_2++) {
				value[i_1][i_2] = ran_gaussian(mean, stdev);
			}
		}
	}

	void init_column(double mean, double stdev, int column) {
		for (uint i_1 = 0; i_1 < dim1; i_1++) {
			value[i_1][column] = ran_gaussian(mean, stdev);
		}
	}
};


#endif /*MATRIX_H_*/
