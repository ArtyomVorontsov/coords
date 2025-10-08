#ifndef COORDS_H
#define COORDS_H

#ifdef __cplusplus
extern "C" {
#endif

// Structure to hold results
struct MaxCoords {
    double x;
    double y;
    double z;
};

// Function to compute max coordinates from a file
// Returns 0 on success, nonzero on error
int get_max_coords(const char* filename, MaxCoords* result);

#ifdef __cplusplus
}
#endif

#endif // COORDS_H
