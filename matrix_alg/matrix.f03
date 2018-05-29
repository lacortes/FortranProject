program test_cpu_time
   implicit none
   real :: start, finish
   real, dimension(1000, 1000) :: matrixA, MatrixB, resultMatrix
   integer :: i, j
   
   do i=1,1000
      do j = 1, 1000
         CALL RANDOM_NUMBER( matrixA(i, j) )
         CALL RANDOM_NUMBER( matrixB(i, j) )
      end do
   end do
   
   print '("Multiplying 1000x1000 Matrices in Fortran")'

   call cpu_time(start)
   
   call matrixMultiply(matrixA, MatrixB, resultMatrix)

   call cpu_time(finish)

   print '("Time = ",I7," ms.")', INT((finish-start)*1000)
end program test_cpu_time

subroutine matrixMultiply(matrixA, matrixB, resultMatrix) 
implicit none

   real, dimension(1000,1000) :: matrixA, MatrixB, resultMatrix
   integer :: i, j, k
   
   do i=1,1000
      do j = 1, 1000
         resultMatrix(i, j) = 0
         do k = 1, 1000
            resultMatrix(i, j) = matrixA(i, k) + matrixB(k, j)
         end do
      end do
   end do
   
end subroutine matrixMultiply