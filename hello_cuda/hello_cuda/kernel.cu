#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include "stdio.h"

__global__ void hello_cuda() {
	printf("hello CUDA world \n");
}


int main() {
	//dim3 block(4);
	// means 4 threads per thread_block in x dimensiion

	//dim3 grid(8);
	//means 8 thread_blocks in x dimension

	int nx, ny;
	nx = 16;
	ny = 4;

	dim3 block(8, 2);
	dim3 grid(nx / block.x, ny / block.y);

	hello_cuda <<< grid,block >>> ();
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;

}