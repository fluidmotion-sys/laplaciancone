subroutine outer(p)
   integer :: p
   q = 1.0
   do p = 2, p
     q = q * p
   enddo
end subroutine outer
PROGRAM central_diff
  IMPLICIT NONE
  INTEGER, PARAMETER :: nx = 6, ny = 6
  REAL :: dx, dy, u(nx,ny)
  INTEGER :: i, j
  integer :: impedance = 1
  real, dimension(nx) :: ux
  real, dimension(ny) :: uy
  dx = 1.83e-4
  dy = 2.90e-4
  DO j = 1,6
    DO i = 1,6
      u(i,j)=impedance**3
      impedance=impedance+1
    END DO
  END DO
  u(4,3) = 264
  open(1, file = 'heat_map_data.csv', status = 'new')
  DO j = 2,5 !2, 6 ny-1
    DO i = 2,5 !2, nx-1
      !ux = (u(i+1,j) - u(i-1,j)) / dx
      ux = (u(i+1,j) - u(i-1,j)) / dx
      uy = (u(i,j+1) - u(i,j-1)) / dy  
    END DO
    !write(i,j) ux(1), ux(2), ux(3), ux(4), ux(5), ux(6)
    !write(1,*) ux(1), ux(2), ux(3), ux(4), ux(5), ux(6)
    !write(1,*) uy(1), uy(2), uy(3), uy(4), uy(5), uy(6)
  END DO
  do i=1,6
     write(1,*) u(i,1), u(i,2), u(i,3), u(i,4), u(i,5), u(i,6)
     !write(1,*) ux(1), ux(2), ux(3), ux(4), ux(5), ux(6)
  end do
  call outer(impedance)
END PROGRAM central_diff
