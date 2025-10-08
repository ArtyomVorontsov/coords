#include <iostream>
#include "coords.h"

int main() {
    MaxCoords max;
    if (get_max_coords("coordinates.txt", &max) == 0) {
        std::cout << "Max X: " << max.x << "\n";
        std::cout << "Max Y: " << max.y << "\n";
        std::cout << "Max Z: " << max.z << "\n";
    } else {
        std::cerr << "Failed to read coordinates file.\n";
    }
    return 0;
}
