#include <iostream>
#include <iomanip>
#include <sstream>
#include <algorithm>
#include <vector>
#include <fstream>
#include <limits.h>
#include <set>

class PassedArgs {
public:
    double q1;
    double q2;
    double q3;
    double q4;
    
    double c1;
    double c2;
    double c3;
    double c4;
    
    double R;
    
    void input_file(std::string fileName){
        std::ifstream in(fileName);
        in >> q1;
        in >> q2;
        in >> q3;
        in >> q4;
        
        in >> c1;
        in >> c2;
        in >> c3;
        in >> c4;
        
        in >> R;
    }
};

/*
Pi - практическая вероятность
(N - ni) / N

Вероятность отказа элемента
q(t) = 1 - p(t);


*/


int main() {

}