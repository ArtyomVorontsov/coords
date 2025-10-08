#!/bin/bash
# generate_coordinates.sh — create a ~2GB file with random x y z coordinates

OUTPUT_FILE="coordinates.txt"
TARGET_SIZE=$((2 * 1024 * 1024))  # 2 GB in bytes

echo "Generating $OUTPUT_FILE (~2GB)..."

# Remove file if it exists
rm -f "$OUTPUT_FILE"

# We'll generate random floats using awk; loop until the file reaches 2GB
# This method is efficient and avoids storing everything in memory
while [ ! -f "$OUTPUT_FILE" ] || [ $(stat -c%s "$OUTPUT_FILE") -lt $TARGET_SIZE ]; do
  awk -v lines=1000000 'BEGIN {
      srand();
      for (i=0; i<lines; i++) {
          x = (rand()*2000 - 1000);
          y = (rand()*2000 - 1000);
          z = (rand()*2000 - 1000);
          printf("%.6f %.6f %.6f\n", x, y, z);
      }
  }' >> "$OUTPUT_FILE"
  current_size=$(stat -c%s "$OUTPUT_FILE")
  echo -ne "Current size: $((current_size / 1024 / 1024)) MB\r"
done

echo
echo "Done! File size: $(ls -lh "$OUTPUT_FILE" | awk '{print $5}')"
