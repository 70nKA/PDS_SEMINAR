import serial

def receive_byte(port='COM3', baudrate=19200, timeout=15):
    # Initialize the serial port
    ser = serial.Serial(port, baudrate, timeout=timeout)

    try:
        # Read a single byte from the serial port
        byte = ser.read(size=1)
        if byte:
            # Print the received byte in hexadecimal format
            print(f"Received byte: {byte.hex()}")
        else:
            print("No data received (timeout).")
    except serial.SerialException as e:
        print(f"Error: {e}")
    finally:
        # Close the serial port
        ser.close()

if __name__ == "__main__":
    receive_byte()
