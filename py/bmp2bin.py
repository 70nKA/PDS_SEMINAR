def bmp_to_binary(filepath, output_filepath):
    # Open the BMP file in binary mode
    with open(filepath, 'rb') as bmp_file:
        # Read the BMP header
        bmp_header = bmp_file.read(14)  # 14 bytes BMP header
        dib_header = bmp_file.read(40)  # 40 bytes DIB header (most common format)

        # Extract the width and height of the image from the DIB header
        width = int.from_bytes(dib_header[4:8], byteorder='little')
        height = int.from_bytes(dib_header[8:12], byteorder='little')
        bit_count = int.from_bytes(dib_header[14:16], byteorder='little')  # Bits per pixel

        print(f"width: {width}")
        print(f"height: {height}")
        print(f"bit_count: {bit_count}")
        
        # Calculate the number of bytes per pixel
        bytes_per_pixel = bit_count // 8
        print(f"bytes per pixel: {bytes_per_pixel}")
        
        # Calculate the row size in bytes (rows are aligned to 4-byte boundaries)
        row_size = (width * bytes_per_pixel + 3) & ~3
        print(f"row size: {row_size}")
        
        # Go to the beginning of the pixel array data
        pixel_data_offset = int.from_bytes(bmp_header[10:14], byteorder='little')
        bmp_file.seek(pixel_data_offset)
        
        print(f"offset: {pixel_data_offset}")

        # Read pixel data row by row
        pixel_data = []
        for y in range(height):
            row = bmp_file.read(row_size)
            # Keep only the actual pixel data part of the row
            pixel_row = row[:width * bytes_per_pixel]
            pixel_data.append(pixel_row)

    # Convert to a single binary string of pixel data
    binary_pixel_data = b''.join(pixel_data)

    # Save binary pixel data to a text file
    with open(output_filepath, 'wb') as output_file:
        output_file.write(binary_pixel_data)

    print(f"Binary pixel data has been saved to {output_filepath}")
    return binary_pixel_data

if __name__ == "__main__":
    bmp_to_binary("lena_256.bmp", "lena_bin.txt")