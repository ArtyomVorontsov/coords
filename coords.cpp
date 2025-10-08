#include "coords.h"
#include <fstream>
#include <iostream>
#include <limits>

int get_max_coords(const char* filename, MaxCoords* result) {
    if (!filename || !result)
        return 1;

    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Cannot open file: " << filename << std::endl;
        return 2;
    }

    double x, y, z;
    double max_x = -std::numeric_limits<double>::infinity();
    double max_y = -std::numeric_limits<double>::infinity();
    double max_z = -std::numeric_limits<double>::infinity();

    while (file >> x >> y >> z) {
        if (x > max_x) max_x = x;
        if (y > max_y) max_y = y;
        if (z > max_z) max_z = z;
    }

    result->x = max_x;
    result->y = max_y;
    result->z = max_z;

    return 0;
}
