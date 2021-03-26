#include <iostream>
#include <iomanip>
#include <sstream>
#include <algorithm>
#include <vector>
#include <fstream>
#include <limits.h>
#include <set>

#define S_source_id 0
#define T_source_id 5
#define NODE_COUNT (T_source_id+1)
#define NO_CONNECTION 99


#define TO_STRING_HELPER_VAR_NAME to_string_value
#define TO_STRING_HELPER_VAR_DECLARE() std::string TO_STRING_HELPER_VAR_NAME
#define TO_STRING_HELPER(X) TO_STRING_HELPER_VAR_NAME+=std::string(#X)+ std::string(": ") +std::to_string(X) + "\n"

class Path {
public:
    enum SIGN {
        POSITIVE,
        NEGATIVE,
        NOT_SET
        
    } sign;
    static char to_sign(SIGN s){
        if(s == POSITIVE){
            return '+';
        }
        if(s == NEGATIVE){
            return '-';
        }
        return ' ';
    }
    Path(long s_id = -1, long d_id = -1, long w = NO_CONNECTION, SIGN s = NOT_SET) : source_id(s_id), destin_id(d_id), weight(w), sign(s) {}
    long source_id;
    long destin_id;
    long weight;


    std::string to_string(){
        std::string s;
        s+=std::string("source_id: ") +std::to_string(source_id) + "\n";
        s+=std::string("destin_id: ") +std::to_string(destin_id) + "\n";
        s+=std::string("weight: ") +std::to_string(weight) + "\n";
        switch(sign){
            case POSITIVE: 
                s+=std::string("sign: POSITIVE\n");
            break;
            case NEGATIVE: 
                s+=std::string("sign: NEGATIVE\n");
            break;
            case NOT_SET: 
                s+=std::string("sign: NOT_SET\n");
            break;

            default:
            break;
        };
        return s;
    }

    bool operator==(Path& other){
        return  sign == other.sign && 
                source_id == other.source_id &&
                destin_id == other.destin_id &&
                weight == other.weight;
    }
};

class PassedArgs{
public:
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;
    int e = 0;
    int f = 0;
    int g = 0;
    int h = 0;
    int i = 0;
    int j = 0;
    int k = 0;
    int l = 0;
    int m = 0;
    
    void read_from_file(std::string file_name){
        std::ifstream input(file_name);
        input >> a;
        input >> b;
        input >> c;
        input >> d;
        input >> e;
        input >> f;
        input >> g;
        input >> h;
        input >> i;
        input >> j;
        input >> k;
        input >> l;
        input >> m;
        input.close();
    }

    std::string to_string(){
        TO_STRING_HELPER_VAR_DECLARE();
        TO_STRING_HELPER(a);
        TO_STRING_HELPER(b);
        TO_STRING_HELPER(c);
        TO_STRING_HELPER(d);
        TO_STRING_HELPER(e);
        TO_STRING_HELPER(f);
        TO_STRING_HELPER(g);
        TO_STRING_HELPER(h);
        TO_STRING_HELPER(i);
        TO_STRING_HELPER(j);
        TO_STRING_HELPER(k);
        TO_STRING_HELPER(l);
        TO_STRING_HELPER(m);
        return TO_STRING_HELPER_VAR_NAME;
    }
} PArgs;

class Matrix {
public:
    std::vector<Path> paths;

    void push_pair(long p1_id, long p2_id, long w_p1_p2, long w_p2_p1){
        Path p1(p1_id, p2_id, w_p1_p2);
        Path p2(p2_id ,p1_id, w_p2_p1);
        paths.push_back(p1);
        paths.push_back(p2);
    }

    void buldByPassedArgs(PassedArgs pa){

        push_pair(1, 4, pa.e, pa.f);
        push_pair(1, 3, pa.f, pa.j);
        push_pair(1, 2, pa.e, pa.g);
        push_pair(1, S_source_id, pa.e, pa.a);

        push_pair(S_source_id, 4, pa.d, pa.b);
        push_pair(S_source_id, 3, pa.c, pa.i);
        push_pair(S_source_id, 2, pa.b, pa.c);

        push_pair(2, 3, pa.h, pa.a);
        push_pair(2, T_source_id, pa.a, pa.b);
        
        push_pair(3, 4, pa.i, pa.j);
        push_pair(3, T_source_id, pa.k, pa.d);

        push_pair(4, T_source_id, pa.m, pa.e);
    }

    void buildExample(){
        push_pair(1, 4, 5, 9);
        push_pair(1, 3, 9, 7);
        push_pair(1, 2, 5, 6);
        push_pair(1, S_source_id, 5, 10);

        push_pair(S_source_id, 4, 4, 3);
        push_pair(S_source_id, 3, 14, 12);
        push_pair(S_source_id, 2, 3, 5);

        push_pair(2, 3, 15, 10);
        push_pair(2, T_source_id, 10, 3);
        
        push_pair(3, 4, 7, 8);
        push_pair(3, T_source_id, 2, 4);

        push_pair(4, T_source_id, 13, 5);
    }

    int get_connection_index(long node_source, long node_id_target){
        for(int i=0; i<paths.size(); i++){
            if(node_source == paths[i].source_id){
                if(node_id_target == paths[i].destin_id){
                    return i;
                }
            }
        }
        return -1;
    }

    int find_reverse_path_index(Path path){
        for(int i=0; i<paths.size(); i++){
            if(path.source_id == paths[i].destin_id){
                if(path.destin_id == paths[i].source_id){
                    return i;
                }
            }
        }
        return -1;
    }

    std::vector<int> get_all_connected_index(long node_id){
        std::vector<int> out;
        for(int i=0; i<paths.size(); i++){
            if(node_id == paths[i].source_id){
                out.push_back(i);
            }
        }
        return out;
    }

    std::vector<Path> get_all_connected(long node_id){
        std::vector<Path> out;
        std::vector<int> index = get_all_connected_index(node_id);
        for(int i: index){
            out.push_back(paths[i]);
        }
        return out;
    }

    bool is_node_connected(long from_id, long to_id){
        return get_connection_index(from_id, to_id) != -1;
    }
    std::string get_node_id_string(int id){
        std::string out;
        char buffer[30];
        if(id == S_source_id){
            sprintf(buffer,"%4s ","S");
            out += buffer;
        } else if(id == T_source_id){
            sprintf(buffer,"%4s ","t");
            out += buffer;
        } else {
            sprintf(buffer,"%4d ",id);
            out += buffer;
        }
        return out;
    }
    std::string to_string_table_header(int node_count){
        std::string out = "     |";
        for(int i=0; i<node_count; i++){
            out += get_node_id_string(i);
            out += "|";
        }
        return out;
    }
    // S....
    std::string to_string_table_row(int row, int node_count){
        std::string out = "";
        char buffer[30];
        if(row == S_source_id){
            sprintf(buffer,"%4s |","S");
            out += buffer;
        } else if(row == T_source_id){
            sprintf(buffer,"%4s |","t");
            out += buffer;
        } else {
            out += get_node_id_string(row);
            out += "|";
        }
        
        std::vector<Path> connected = get_all_connected(row);
        std::sort(connected.begin(), connected.end(), 
            [](Path a, Path b){return a.destin_id < b.destin_id;}
        );
        
        int connected_index = 0;
        for(int i = 0; i < node_count; i++){
            if(connected_index < connected.size()){
                if(i == connected[connected_index].destin_id){
                    sprintf(buffer,"%4d", connected[connected_index].weight);
                    out += buffer;
                    out += Path::to_sign(connected[connected_index].sign);
                    out += "|";
                    connected_index += 1;
                    continue;
                }
            }
            out += "     |";
        }
        return out;
    }

    void get_all_posible_paths(int to_find_id, 
                                std::vector<int> passed_path, 
                                std::vector<int> available_nodes, 
                                std::vector<std::vector<int>> &push_back){
        int current_node_id = passed_path.back();
        if(available_nodes.size() == 0){
            return;
        }

        std::vector<Path> connected = get_all_connected(current_node_id);

        for(int i=0; i < connected.size(); i++){
            auto it = std::find(available_nodes.begin(), available_nodes.end(), connected[i].destin_id);
            if(it != available_nodes.end()){
                int target_id = *it;
                std::vector<int> passed_path_copy(passed_path);
                passed_path_copy.push_back(target_id);

                if(target_id == to_find_id){
                    push_back.push_back(passed_path_copy);
                    continue;
                }

                std::vector<int> available_nodes_copy(available_nodes);
                auto it_rem = std::find(available_nodes_copy.begin(), available_nodes_copy.end(), target_id);
                available_nodes_copy.erase(it_rem);
                
                get_all_posible_paths(to_find_id, passed_path_copy, available_nodes_copy, push_back);
            }
        }
    }

    std::vector<std::vector<int>> get_paths(int from, int to){
        std::vector<std::vector<int>> out;
        std::vector<int> passed_path;
        passed_path.push_back(from);
        std::vector<int> available_nodes;
        for(int i=0; i < NODE_COUNT; i++){
            if(i != from){
                available_nodes.push_back(i);
            }
        }

        get_all_posible_paths(to, passed_path, available_nodes, out);
        return out;
    }

    bool is_path_valid(std::vector<int> path){
        int start_point = path.front();
        long summary = 0;
        for(int i=1; i < path.size(); i++){
            int index = get_connection_index(start_point, path[i]);
            int reverse_index = find_reverse_path_index(paths[index]);
            
            if(paths[index].weight <= 0){
                return false;
            }
            if(paths[reverse_index].weight <= 0){
                return false;
            }
            summary += paths[index].weight;
            start_point = path[i];
        }
        
        return summary>0;
    }

    long mark_positive_negative_2(std::vector<int> path){
        int start_point = path.front();
        long thetha = INT_MAX;
        for(int i=1; i < path.size(); i++){
            int index = get_connection_index(start_point, path[i]);
            int reverse_index = find_reverse_path_index(paths[index]);

            paths[index].sign = Path::NEGATIVE;
            paths[reverse_index].sign = Path::POSITIVE;

            if(paths[index].weight > 0) {
                thetha = std::min(thetha, paths[index].weight);
            }

            start_point = path[i];
        }
        if(thetha == INT_MAX){
            thetha = 0;
        }
        return thetha;
    }

    void modify_by_thetha(long thetha){
        for(int i=0; i<paths.size(); i++){
            if(paths[i].sign != Path::NOT_SET){
                if(paths[i].sign == Path::POSITIVE){
                    paths[i].weight += thetha;
                }
                if(paths[i].sign == Path::NEGATIVE){
                    paths[i].weight -= thetha;
                }
                
                paths[i].sign = Path::NOT_SET;
            }
        }
    }

    void substract_paths(Matrix& other){
        for(int i=0; i<paths.size(); i++){
            paths[i].weight -= other.paths[i].weight;
            if(paths[i].weight < 0 ){
                paths[i].weight = 0;
            }
        }
        
    }
    
} MatrixS;

std::string to_string_node_id(int id){
    if(id == T_source_id){
        return "t";
    }
    if(id == S_source_id){
        return "S";
    }
    return std::to_string(id);
}

#define BUILD_EXAMPLE 0

int main() {

    PArgs.read_from_file("data.txt");
    std::cout << PArgs.to_string();

    
    #if BUILD_EXAMPLE
        MatrixS.buildExample();
    #else
        MatrixS.buldByPassedArgs(PArgs);
    #endif
    std::cout << "\n";

    //std::cout << "All possible paths:\n";
    
    #if BUILD_EXAMPLE
        std::vector<std::vector<int>> all_paths;
        {
            std::vector<int> to_push = {S_source_id, 1, 4, T_source_id};
            all_paths.push_back(to_push);
        }
        {
            std::vector<int> to_push = {S_source_id, 3, 2, T_source_id};
            all_paths.push_back(to_push);
        }
        {
            std::vector<int> to_push = {S_source_id, 1, 3, 4, T_source_id};
            all_paths.push_back(to_push);
        }
        {
            std::vector<int> to_push = {S_source_id, 4, T_source_id};
            all_paths.push_back(to_push);
        }
        {
            std::vector<int> to_push = {S_source_id, 3, T_source_id};
            all_paths.push_back(to_push);
        }
    #else
        std::vector<std::vector<int>> all_paths = MatrixS.get_paths(S_source_id, T_source_id);
    #endif
    

    std::sort(all_paths.begin(), all_paths.end(),
    [](std::vector<int>& a, std::vector<int>& b)-> bool {
        return a.size() < b.size();
    });
    
    /* for(std::vector<int> vec : all_paths){
        for(int path : vec){
            std::cout << to_string_node_id(path) << " ";
        }
        std::cout << "\n";
    } */
    
    std::cout << "----\n";

    std::cout << "Starting table: C = \n";
    std::cout << MatrixS.to_string_table_header(NODE_COUNT) << "\n";
    
    for(int i=0; i < NODE_COUNT; i++){
        std::cout << MatrixS.to_string_table_row(i, NODE_COUNT) << "\n";
    }
    std::cout << "\n\n";

    int passed_paths = 0;
    int thetha_sum = 0;
    for(int i=0; i < all_paths.size(); i++){
        if(MatrixS.is_path_valid(all_paths[i])){
            long thetha = MatrixS.mark_positive_negative_2(all_paths[i]);

            std::cout << "processing path:\n";
            for(int j = 0; j < all_paths[i].size(); j++){
                std::cout << to_string_node_id(all_paths[i][j]);
                if(j < (all_paths[i].size()-1)){
                    std::cout << " -> ";
                }
            }
            std::cout << "\n";

            std::cout << MatrixS.to_string_table_header(NODE_COUNT) << "\n";
    
            for(int i=0; i < NODE_COUNT; i++){
                std::cout << MatrixS.to_string_table_row(i, NODE_COUNT) << "\n";
            }

            MatrixS.modify_by_thetha(thetha);
            thetha_sum += thetha;
            
            std::cout << "Thetha = "<< thetha << "\n";
            std::cout << MatrixS.to_string_table_header(NODE_COUNT) << "\n";
    
            for(int i=0; i < NODE_COUNT; i++){
                std::cout << MatrixS.to_string_table_row(i, NODE_COUNT) << "\n";
            }
            std::cout << "\n";
            passed_paths+=1;
        }
    }

    Matrix MatrixC;

    #if BUILD_EXAMPLE
        MatrixC.buildExample();
    #else
        MatrixC.buldByPassedArgs(PArgs);
    #endif
    std::cout << "\n";
    
    std::cout << "C'' table:\n";
    std::cout << MatrixC.to_string_table_header(NODE_COUNT) << "\n";
    
    for(int i=0; i < NODE_COUNT; i++){
        std::cout << MatrixC.to_string_table_row(i, NODE_COUNT) << "\n";
    }

    std::cout << "C table:\n";
    std::cout << MatrixC.to_string_table_header(NODE_COUNT) << "\n";
    
    for(int i=0; i < NODE_COUNT; i++){
        std::cout << MatrixC.to_string_table_row(i, NODE_COUNT) << "\n";
    }

    MatrixC.substract_paths(MatrixS);
    std::cout << "X table \"X = C'' - C\" :\n";
    std::cout << MatrixC.to_string_table_header(NODE_COUNT) << "\n";
    
    for(int i=0; i < NODE_COUNT; i++){
        std::cout << MatrixC.to_string_table_row(i, NODE_COUNT) << "\n";
    }

    std::cout /* << "total: " << all_paths.size() << " used: "<< passed_paths */ << " Thetha_sum = " << thetha_sum <<"\n";

    std::cout << "\n\n\n\n";
    std::cout << "Ctrl+C to exit\n";
    char pauser;
    std::cin >> pauser;
    return 0;
}