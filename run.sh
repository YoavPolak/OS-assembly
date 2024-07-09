#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <assembly_source_file>"
    exit 1
fi

# Extract the filename from the parameter
asm_file="$1"

# Assemble the assembly code
as "$asm_file" -o "${asm_file%.s}.o"

# Link using gcc
gcc -o "${asm_file%.s}" "${asm_file%.s}.o" -nostdlib -static

# Run the executable
"./${asm_file%.s}"

# Remove unnecessary files
rm "${asm_file%.s}.o"
rm ".o"
