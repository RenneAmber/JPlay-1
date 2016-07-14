#ifndef MEMORY_H_
#define MEMORY_H_

#include <vector>
#include <cassert>
#include <string>
#include <iostream>

using std::cout;
using std::endl;
using std::string;

typedef unsigned long long int uint64;
typedef signed long long int int64;

class MemoryLog {
private:
	uint64 mem_size;

public:
	/* Singleton */
	static MemoryLog& getInstance() {
		static MemoryLog instance;
		return instance;
	}

	MemoryLog() {
		mem_size = 0;
	}

	void log_new(string message, uint64 size, uint64 count = 1) {
		mem_size += size * count;
		//cout << "total memory consumption=" << mem_size << " bytes" << "\t" << "reserving " << count << "*" << size << " for " << message << endl;
	}
	void log_free(string message, uint64 size, uint64 count = 1) {
		mem_size -= size * count;
		//cout << "total memory consumption=" << mem_size << " bytes" << "\t" << "deleting " << count << "*" << size << " for " << message << endl;
	}

};


#endif
