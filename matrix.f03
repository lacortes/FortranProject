program test_cpu_time
	implicit none		! disables an old feature of fortran 
						! that treats all variables that start with i, j, k, l, m and n 
						! as integers and all others as real arguments. 
  
	Real :: start, finish
	real, dimension(1000, 1000) :: matrixA, MatrixB, resultMatrix
	integer :: i, j
   
	do i=1,1000
		do j = 1, 1000
			call random_number( matrixA(i, j) )
			CALL RANDOM_NUMBER( matrixB(i, j) )
		end do
	end do
   
	PRINT '("Multiplying 1000x1000 Matrices in Fortran")'

	call Cpu_time(start)
   
	call matriXMultiply(MAtrixA, MatrixB, resultMatrix)

	call cpu_time(finish)

	print '("Time = ",i7," ms.")', INT((finish-start)*1000)
	
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
return    
end subroutine matrixMultiply