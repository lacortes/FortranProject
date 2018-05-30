import random, time

def multiply_matrix(m1,m2, dimension):
    #  Matrix to hold results
    result = [[0 for x in range(dimension)] for x in range(dimension)]

    for row in range(dimension):
        for col_m1 in range(dimension):
            for row_m2 in range(dimension):
                result[row][col_m1] += m1[row][row_m2] * m2[row_m2][col_m1]
    return result


def main():
    print("Multiplying 1000x1000 Matrices in Python")

    generate_matrix = lambda dimension: [ [random.randint(0, 1001) for x in range(dimension)] for row in range(dimension)]
    time_milli = lambda: int(round(time.time()*1000))

    dimension = 1000

    matrix1 = generate_matrix(dimension)
    matrix2 = generate_matrix(dimension)

    start_time = time_milli()
    multiply_matrix(matrix1, matrix2, dimension)
    end_time = time_milli()

    elapsed = end_time - start_time

    print("Time: {0} ms".format(elapsed))
    

if __name__ == "__main__":
    main()