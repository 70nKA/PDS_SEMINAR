import serial
import time

def send_bmp_image_over_uart(file_path, serial_port, baud_rate=115200):
    try:
        # Open the serial port
        ser = serial.Serial(serial_port, baud_rate, timeout=1)
        print(f"Opened serial port {serial_port} at {baud_rate} baud.")

        # Calculate the delay based on the baud rate
        delay_per_byte = 1 / baud_rate  # Delay in seconds for one baud rate clock period

        # Open the BMP file in binary mode
        with open(file_path, 'rb') as bmp_file:
            # Skip the BMP header (first 54 bytes)
            bmp_file.seek(54)

            # Read the entire pixel data from the BMP file
            pixel_data = bmp_file.read()
            data_size = len(pixel_data)
            print(f"Read entire BMP pixel data of size {data_size} bytes.")

            # Send the pixel data over UART with delay
            print("Sending entire BMP pixel data over UART with delay...")
            for byte in pixel_data:
                ser.write(byte.to_bytes(1, byteorder='big'))  # Send one byte
                time.sleep(delay_per_byte)  # Delay for one baud rate clock cycle
            print("Entire BMP pixel data sent successfully with delay.")

        # Close the serial port
        ser.close()
        print("Closed serial port.")

    except serial.SerialException as e:
        print(f"Error: Could not open serial port {serial_port}: {e}")
    except FileNotFoundError:
        print(f"Error: BMP file {file_path} not found.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Configuration parameters
    bmp_file_path = 'lena_gray.bmp'  # Path to your BMP file
    serial_port = 'COM3'         # Serial port connected to FPGA (e.g., COM3 on Windows, /dev/ttyUSB0 on Linux)
    baud_rate = 115200           # Baud rate for UART communication

    send_bmp_image_over_uart(bmp_file_path, serial_port, baud_rate)
