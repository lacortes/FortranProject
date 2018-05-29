#include "sstream"
#include <iostream>
#include <chrono>

double** generateMatrix(int n);
double** multiply(double** left, double** right, int N);

int main()
{
	std::cout << "Multiplying 1000x1000 Matrices in C++\n";
	double** largeM1 = generateMatrix(1000);
	double** largeM2 = generateMatrix(1000);
	std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
	multiply(largeM1, largeM2, 1000);
	std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
	std::cout << "Time: " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count() << "ms" << std::endl;

}

double** generateMatrix(int n) {
	srand(time(NULL));
	double** result = new double*[n];
	for (int i = 0; i < n; ++i) {
		result[i] = new double[n];
		for (int j = 0; j < n; j++) {
			result[i][j] = rand() % n + 1;
		}
	}
	return result;
}

double** multiply(double** left, double** right, int N)
{
	double** result = new double*[N];
	for (int i = 0; i < N; i++)
	{
		result[i] = new double[N];
		for (int j = 0; j < N; j++)
		{
			result[i][j] = 0;
			for (int k = 0; k < N; k++)
			{
				result[i][j] += left[i][k] * right[k][j];
			}
		}
	}
	return result;
}