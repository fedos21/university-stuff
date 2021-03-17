#include <iostream>
#include <algorithm>
#include <vector>
#include <fstream>
#include <limits.h>
#include <set>

/* Dijkstra */
struct d_link {
    int start_node_id = -1;
    int end_node_id = -1;
    long cost = 0;

    std::string to_string(){
        std::string out;
        out += std::string("start_node_id: ") + std::to_string(start_node_id) + "\n";
        out += std::string("end_node_id: ") + std::to_string(end_node_id) + "\n";
        out += std::string("cost: ") + std::to_string(cost) + "\n";
        return out;
    }

    bool is_valid(){
        return start_node_id != -1 && end_node_id != -1;
    }
    // ​true if the first argument is less than second
    static bool compare_by_cost(d_link& a, d_link& b){
        return a.cost < b.cost;
    } 
};

struct d_node {
    static const long initial_weight = INT_MAX;
    long node_id = -1;
    long weight = initial_weight;

    std::string to_string(){
        std::string out;
        out += std::string("node_id: ") + std::to_string(node_id) + "\n";
        out += std::string("weight: ") + std::to_string(weight) + "\n";
        return out;
    }

    static bool compare_by_weight(d_node& a, d_node& b){
        return a.weight < b.weight;
    }

    bool is_linked(d_link link){
        return link.start_node_id == node_id || link.end_node_id == node_id;
    }

    void set_if_weight_lower(long new_weight){
        if(new_weight < weight){
            weight = new_weight;
        }
    }

    static int get_index_by_id(std::vector<d_node>& nodes, long id){
        for(int i = 0; i < nodes.size(); i++){
            if(nodes[i].node_id == id){
                return i;
            }
        }
        return -1;
    }

    int get_next_link_index(std::vector<d_link>& links){
        for(int i = 0; i < links.size(); i++){
            if(is_linked(links[i])){
                return i;
            }
        }
        return -1;
    }

    int get_other_node_id(d_link link){
        if(link.start_node_id == node_id){
            return link.end_node_id;
        }
        if(link.end_node_id == node_id){
            return link.start_node_id;
        }
        return -1;
    }
};


class NodeParser {
    long start_node = -1;
    long end_node = -1;
    std::vector<d_link> links;

    public:
    NodeParser(){

    }
    
    void parse_file(std::string file_name){
        std::ifstream input(file_name);

        links.clear();

        input >> start_node;
        input >> end_node;

        while( !input.eof() ){
            d_link link;
            input >> link.start_node_id;
            input >> link.end_node_id;
            input >> link.cost;

            links.push_back(link);
        }
    }

    std::set<int> getNodeIds(){
        std::set<int> unique_nodes;

        unique_nodes.insert(start_node);
        unique_nodes.insert(end_node);

        for(int i = 0; i < links.size(); i++){
            unique_nodes.insert(links[i].start_node_id);
            unique_nodes.insert(links[i].end_node_id);
        }
        return unique_nodes;
    }

    long getStartingNode(){
        return start_node;
    }

    long getEndingNode(){
        return end_node;
    }

    std::vector<d_link> getLinks(){
        return links;
    }

};

std::vector<d_node> compute_node_weights(std::vector<d_link> links, std::vector<d_node> nodes, long starting_node){
    std::vector<d_node> output;
    int starting_node_index = d_node::get_index_by_id(nodes, starting_node);
    nodes[starting_node_index].weight = 0;

    while(nodes.size() > 0){
        std::sort(nodes.begin(), nodes.end(), d_node::compare_by_weight);

        int found_link_index;
        do {
            found_link_index = nodes[0].get_next_link_index(links);
            if (found_link_index == -1){
                break;
            }

            int target_node_id = nodes[0].get_other_node_id(links[found_link_index]);


            int node_index = d_node::get_index_by_id(nodes, target_node_id);
            nodes[node_index].set_if_weight_lower(nodes[0].weight + links[found_link_index].cost);

            links.erase(links.begin() + found_link_index);
        } while ( found_link_index != -1 );
        
        output.push_back(nodes[0]);
        nodes.erase(nodes.begin());
    }
    std::sort(output.begin(), output.end(), d_node::compare_by_weight);
    return output;
}

std::vector<d_node> get_path_by_weights(std::vector<d_link> links, std::vector<d_node> nodes, long end_node_id, long start_node_id){
    std::vector<d_node> output;

    
    int current_node_index = d_node::get_index_by_id(nodes, end_node_id);
    
    while (nodes[current_node_index].node_id != start_node_id){
        int found_link_index = nodes[current_node_index].get_next_link_index(links);

        long other_side_id = nodes[current_node_index].get_other_node_id(links[found_link_index]);
        int other_side_index = d_node::get_index_by_id(nodes, other_side_id);

        if( nodes[current_node_index].weight == nodes[other_side_index].weight + links[found_link_index].cost){
            output.push_back(nodes[current_node_index]);
            current_node_index = other_side_index;
        }

        links.erase(links.begin() + found_link_index);
    }
    output.push_back(nodes[current_node_index]);

    return output;
}

int main() {
    NodeParser parser;
    parser.parse_file("data.txt");
    
    std::vector<d_link> links = parser.getLinks();
    std::vector<d_node> nodes;

    std::set<int> unique_node_ids = parser.getNodeIds();

    for(int id : unique_node_ids){
        d_node node;
        node.node_id = id;
        nodes.push_back(node);
    }

    long start_node = parser.getStartingNode();
    long end_node = parser.getEndingNode();

    std::vector<d_node> weighted_nodes = compute_node_weights(links, nodes, start_node);

    for(d_node& node : weighted_nodes){
        std::cout << node.to_string();
        std::cout << "---\n";
    }

    std::vector<d_node> path = get_path_by_weights(links, weighted_nodes, end_node, start_node);

    std::cout << "Path: [end - start]\n";
    for(d_node& node : path){
        std::cout << node.node_id;
        if(node.node_id != start_node){
            std::cout << " - ";
        }
    }
    std::cout << "\n\n\n\n";
    std::cout << "Ctrl+C to exit\n";
    char pauser;
    std::cin >> pauser;
    return 0;
}