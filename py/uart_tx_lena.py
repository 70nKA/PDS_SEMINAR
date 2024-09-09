import serial
import time

def send_bytes_from_file_with_delays(file_path, serial_port, baud_rate=115200):
    try:
        # Open the serial port
        ser = serial.Serial(serial_port, baud_rate, timeout=1)
        print(f"Opened serial port {serial_port} at {baud_rate} baud.")

        # Calculate the delay based on the baud rate
        delay_per_byte = 1 / baud_rate  # Delay in seconds for one baud rate clock period

        # Open the file containing hex bytes stored in each row
        with open(file_path, 'r') as hex_file:
            # Read all lines from the file
            lines = hex_file.readlines()
            total_bytes = len(lines)
            print(f"Read {total_bytes} bytes from the file.")

            # Initialize counters
            bytes_sent = 0

            print("Sending bytes from file over UART with delays...")
            for i, line in enumerate(lines):
                # Convert the hex value (one per line) to a byte
                byte = int(line.strip(), 16)
                ser.write(byte.to_bytes(1, byteorder='big'))  # Send one byte
                time.sleep(delay_per_byte)  # Delay for one baud rate clock cycle

                # Increment the bytes sent counter
                bytes_sent += 1

                # Check if we have sent 512 bytes
                if bytes_sent % 512 == 0:
                    print(f"Sent {bytes_sent} bytes. Pausing for 1 second...")
                    time.sleep(1)  # Pause for 1 second after every 512 bytes

                # After 28 sets of 512 bytes (14336 bytes), pause for 5 seconds
                if bytes_sent % (28 * 512) == 0:
                    print(f"Sent {bytes_sent} bytes. Pausing for 5 seconds...")
                    time.sleep(5)  # Pause for 5 seconds

            print("All bytes sent successfully with required delays.")

        # Close the serial port
        ser.close()
        print("Closed serial port.")

    except serial.SerialException as e:
        print(f"Error: Could not open serial port {serial_port}: {e}")
    except FileNotFoundError:
        print(f"Error: File {file_path} not found.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Configuration parameters
    hex_file_path = 'lena_hex2.txt'  # Path to your file with hex bytes
    serial_port = 'COM3'         # Serial port connected to FPGA (e.g., COM3 on Windows, /dev/ttyUSB0 on Linux)
    baud_rate = 115200           # Baud rate for UART communication

    send_bytes_from_file_with_delays(hex_file_path, serial_port, baud_rate)
