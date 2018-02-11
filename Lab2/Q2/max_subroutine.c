
// make reference to MAX_2 method in c
extern int MAX_2(int x, int y);

int main() {
	int arr[5] = {1,19,3,4,5};	// array
	int counter;
	int max_val = arr[0];			// take first value of array
	for (counter = 1; counter <= 4; counter++){	// iterate from element 1 to 4
		max_val=MAX_2(max_val,arr[counter]);
	}
	//r4 holds the return value
	return max_val;				// return the max
}
