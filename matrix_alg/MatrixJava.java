import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class MatrixJava {
    public static void main(String[] args){
        System.out.println("Multiplying 1000x1000 Matrices in Java");
        double[][] M1 = generateMatrix(1000);
        double[][] M2 = generateMatrix(1000);
        long startTime = System.currentTimeMillis();
        multiply(M1, M2, 1000);
        long endTime = System.currentTimeMillis();
        System.out.print("Time: ");
        System.out.print(endTime - startTime);
        System.out.println("ms");
    }

    public static double[][] generateMatrix(int n){
        double[][] result = new double[n][];
        for (int i = 0; i < result.length; i++) {
            result[i] = new double[n];
            for (int j = 0; j < result.length; j++) {
                int random = ThreadLocalRandom.current().nextInt(0, 1001);
                result[i][j] = random;
            }
        }
        return result;
    }

    public static double[][] multiply(double[][] left, double[][] right, int n){
        double[][] result = new double[n][];
        for (int i = 0; i < result.length; i++) {
            result[i] = new double[n];
            for (int j = 0; j < result.length; j++) {
                result[i][j] = 0;
                for (int k = 0; k < result.length; k++) {
                    result[i][j] += left[i][k] * right[k][j];
                }
            }
        }
        return result;
    }
}

