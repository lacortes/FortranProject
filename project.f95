module objects			! module used for type definition and 
	implicit none
	type shape   		! type used as head of derivation 
		! leaving empty 
	end type shape
	
	
	type, extends(shape) :: ball	! ball type 
		real :: resistRatio = 0.75		! used for faux wind resist
	end type ball
			
	type, extends(shape) :: cube	! cube type 
		real :: resistRatio = 2		! used for faux wind resist
	end type cube
			
	type, extends(ball) :: baseBall	! baseBall type 
		real :: mass = 0.145		! actual mass of baseBall
	end type baseBall
	
	type, extends(ball) :: soccerBall ! soccerBall type
		real :: mass = 0.43 		! mass of soccerball
	end type soccerBall

	type, extends(cube) :: rubixCube ! type rubixCube
		real :: mass = 0.145
	end type rubixCube
	
	type, extends(cube) :: smallCrate ! type smallCrate
		real :: mass = 0.43
	end type smallCrate

	
end module 



subroutine tossObject(objResist , velocity, angle)
	implicit none 
	
	! gravitational acceleration
	real, parameter :: gravity = -9.80665

	
	real :: objResist
	real :: velocity
	real :: angle 
	real :: adjustedVelocity
	real :: Y_velocity
	real :: X_velocity
	real :: changeInVelocity_Y
	real :: timeInAir
	real :: distanceThrown
	
	adjustedVelocity = velocity - objResist		! mass and resistance slow down velocity
	
	Y_velocity = adjustedVelocity * SIN( angle )	! getting velocity in Y direction 
	
	changeInVelocity_Y = -2* ABS(Y_velocity)	! change in Y_velocity = final - initial
												! final - initial = -2(Y_velocity)
	
	timeInAir = changeInVelocity_Y / gravity	! time object is in air 
	
	X_velocity = adjustedVelocity * COS( angle ) ! getting velocity in x direction 
	
	distanceThrown = X_velocity * timeInAir		! getting distanceThrown
	
	
	print*, 'The Object traveled a total of', distanceThrown, 'meters.'
	
	
end subroutine tossObject


program objectThrow
	use objects 			! uses module objects 
	implicit none 			! this handles old issue with fortran

	! the value of pi 
	real, parameter :: pi = 3.141592654
	
	
	type(BASEBall) :: BB 	! baseball object 
	real :: baseballinfo
	baseballinfo = BB%mass * BB%resistRatio	! baseball object data 
	
	!type(soccerBall) :: SB	! soccerBall object
	!real :: soccerBallinfo
	!soccerBallinfo = SB%mass * SB%resistRatio
	
!	type(rubixCube) :: RC 	! rubix object  
!	real :: rubixinfo
!	rubixinfo = rc%mass * rc%resistRatio	
	
!	type(smallCrate) :: SC	! smallCrate object
!	real :: smallCrateinfo
!	smallCrateinfo = Sc%mass * Sc%resistRatio
	
	
	print*, 'Baseball'
	call tossObject( baseballinfo , 10.0 , ( pi / 6 )  )	
	
!	print*, 'Soccerball'
!	call tossObject( soccerBallinfo, 10.0 , ( pi / 6 )	)
	
!	print*, 'Rubix Cube'
!	call tossObject( rubixinfo , 10.0 , ( pi / 6 )  )	
	
!	print*, 'Small Crate'
!	call tossObject( smallCrateinfo, 10.0 , ( pi / 6 )	)
	
	
	
	
	
	

end program objectThrow

