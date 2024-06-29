import serial

# Configure the serial port (replace 'COM3' with your serial port name)
ser = serial.Serial(
    port='COM3',        # Use your serial port
    baudrate=230400,    # Set your baud rate
    timeout=1           # Set a timeout value (1 second in this case)
)

# Check if the serial port is open
if ser.is_open:
    print("Serial port is open")

    try:
        while True:
            # Get a 1-byte hex input from the user
            hex_input = input("Enter a 1-byte hex value (e.g., 01) to send or type 'exit' to quit: ")

            # Allow the user to exit the loop
            if hex_input.lower() == 'exit':
                break

            try:
                # Convert the hex input to a byte
                byte_to_send = bytes.fromhex(hex_input)

                if len(byte_to_send) != 1:
                    raise ValueError("Invalid length")

                # Send the byte over UART
                ser.write(byte_to_send)
                print(f"Byte sent: {byte_to_send.hex()}")

            except ValueError:
                print("Invalid input. Please enter a valid 1-byte hex value.")
                
    except KeyboardInterrupt:
        print("\nInterrupted by user")

    # Close the serial port
    ser.close()
    print("Serial port is closed")
else:
    print("Failed to open serial port")
