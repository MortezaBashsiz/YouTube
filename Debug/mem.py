import numpy as np
import time

def utilize_memory(size_in_gb):
    
    # Allocate memory (convert GB to number of 64-bit elements)
    num_elements = size_in_gb * (1024**3) // 8
    memory_array = np.zeros(num_elements, dtype=np.float64)  # Use numpy to allocate memory in RAM

    for i in range(100000):  # Run some operations to keep memory busy
        memory_array += 1.0  # Modify the data to ensure it stays in RAM
        time.sleep(1)  # Pause briefly to simulate sustained usage

    print("Memory utilization complete. Keeping data in RAM for observation.")
    time.sleep(6000)  # Keep memory allocated for 10 minutes to observe usage

if __name__ == "__main__":
    try:
        size_in_gb = 2
        utilize_memory(size_in_gb)
    except MemoryError:
        print("Error: Not enough memory available to allocate the requested size.")
    except KeyboardInterrupt:
        print("Script interrupted by user.")

