#include <iostream>
#include <iomanip>
#include <sstream>
#include <algorithm>
#include <vector>
#include <fstream>
#include <limits.h>
#include <set>


#define INF 99

class FloydMartrix {
private:
    void allocate(int size){
        this->size = size;
        D_matrix = new int*[size];
        S_matrix = new int*[size];

        for(int i=0; i<size; i++){
            D_matrix[i] = new int[size];
            S_matrix[i] = new int[size];
        }

        for(int i=0; i<size; i++){
            for(int j=0; j<size; j++){
                S_matrix[i][j] = j;
                if(i == j){
                    S_matrix[i][j] = -1;
                }
            }
        }
    }

public:
    int path_from;
    int path_to;

    int k = 0;
    int size;
    int **D_matrix;
    int **S_matrix;


    FloydMartrix(){

    }

    void parseFile(std::string name){
        std::ifstream input(name);
        input >> size;
        input >> path_from;
        path_from -= 1;
        input >> path_to;
        path_to   -= 1;

        allocate(size);

        for(int i = 0; i < size; i++){
            for(int j = 0; j < size; j++){
                input >> D_matrix[i][j];
            }
        }
    }
    
    // return has next layer
    bool computeNext(){
        if(k == size){
            return false;
        }
        for(int i = 0; i < size; i++){
            for(int j = 0; j < size; j++){
                if(i == j){
                    continue;
                }
                if(D_matrix[i][j] > D_matrix[i][k] + D_matrix[k][j]){
                    D_matrix[i][j] = D_matrix[i][k] + D_matrix[k][j];
                    S_matrix[i][j] = k;
                }     
            }
        }

        k++;
        return true;
    }

    void outputMatrix(){
        std::cout << "D" << k << "  ";
        for(int i = 0; i < size; i++){
            std::cout << " " << i+1 << " ";
        }
        std::cout << "  |   " ;
        std::cout << "S" << k+1 << "  ";
        for(int i = 0; i < size; i++){
            std::cout << " " << i+1 << " ";
        }
        std::cout << "\n";

        for(int i=0; i < size; i++){
            std::cout << i+1 << " |";
            for(int j = 0; j < size; j++){
                std::cout << std::setfill(' ');
                std::cout << std::setw(3);
                if(D_matrix[i][j] == 0){
                    std::cout << " --";
                } else {
                    std::cout << D_matrix[i][j];
                }
                
            }
            std::cout << "   |   " ;
            std::cout << i+1 << " |";
            for(int j = 0; j < size; j++){
                std::cout << std::setfill(' ');
                if(S_matrix[i][j] == -1){
                    std::cout << " --";
                } else {
                    std::cout << std::setw(3) << S_matrix[i][j] +1;
                }
                
            }
            std::cout << "\n";
        }
        std::cout << std::setw(0);
        std::cout << "\n";
    }

    std::vector<int> getPath(){
        std::vector<int> out;
        out.push_back(path_from);
        
        int current = path_from;
        while (current != path_to){
            int inter_link = S_matrix[current][path_to];
            out.push_back(inter_link);
            current = inter_link;
        }
        return out;
    }

};


int main() {
    FloydMartrix matrix;
    matrix.parseFile("data.txt");
    matrix.outputMatrix();
 
    while (matrix.computeNext()){
        std::cout << "---------------------------------------------\n";
        matrix.outputMatrix();
    }
    std::cout << "\nPath: " << matrix.path_from + 1 << " -> " << matrix.path_to + 1<< "\n";
    std::vector<int> path = matrix.getPath();
    for(int p : path){
        std::cout << p + 1;
        if(p != matrix.path_to){
            std::cout << " - ";
        }
    }
    std::cout << "\n\n\n\n";
    std::cout << "Ctrl+C to exit\n";
    char pauser;
    std::cin >> pauser;
    return 0;
}