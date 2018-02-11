#include<stdio.h>

int main() {
	int arr[5] = {1,20,3,4,5};	// array
	int counter;
	int max_val = arr[0];			// take first value of array
	for (counter = 0; counter < 4; counter++){	// iterate from element 1 to 4
		if (max_val < arr[counter]){	// if this value is greater than our current max 
			max_val = arr[counter];		// replace the max
		}else{
		 //do nothing
		}
	}

	return max_val;				// return the max
}
