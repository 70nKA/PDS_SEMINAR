import serial
import time

def main():
    # Configure the serial port (replace 'COM3' with your serial port name)
    ser = serial.Serial(
        port='COM3',        # Use your serial port
        baudrate=115200,     # Set your baud rate
        timeout=1           # Set a timeout value (1 second in this case)
    )

    # Check if the serial port is open
    ##if ser.is_open:
        print("Serial port is open")

        try:
            # Iterate from 0x00 to 0xFF
            for i in range(256):
                byte_to_send = bytes([i])
                
                # Send the byte over UART
                ser.write(byte_to_send)
                print(f"Byte sent: {byte_to_send.hex()}")

                # Wait for 2 seconds before sending the next byte
                time.sleep(0.0002)

        except KeyboardInterrupt:
            print("\nInterrupted by user")

        # Close the serial port
        ser.close()
        print("Serial port is closed")
    else:
        print("Failed to open serial port")

if __name__ == "__main__":
    main()