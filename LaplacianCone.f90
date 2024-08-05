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
  integer :: impedance = 5
  real, dimension(nx) :: ux
  real, dimension(ny) :: uy
  dx = 1.83e-4
  dy = 2.90e-5
  u(1,1) = 0
  u(1,2) = 2
  u(1,3) = 3
  u(1,4) = 40
  u(1,5) = 5
  u(1,6) = 6
  u(2,1) = 7
  u(2,2) = 8
  u(2,3) = 9
  u(2,4) = 10
  u(2,5) = 11
  u(2,6) = 12
  u(3,1) = 13
  u(3,2) = 14
  u(3,3) = 15
  u(3,4) = 16
  u(3,5) = 17
  u(3,6) = 18
  u(4,1) = 19
  u(4,2) = 20
  u(4,3) = 264
  u(4,4) = 22
  u(4,5) = 23
  u(4,6) = 24
  u(5,1) = 25
  u(5,2) = 26
  u(5,3) = 27
  u(5,4) = 28
  u(5,5) = 29
  u(5,6) = 30
  u(6,1) = 31
  u(6,2) = 32
  u(6,3) = 33
  u(6,4) = 34
  u(6,5) = 35
  u(6,6) = 36
  u(1,ny) = 0
  u(nx,ny) = 0
  u(nx,1) = 0
  DO j = 2, ny-1
    DO i = 2, nx-1
      ux = (u(i+1,j) - u(i-1,j)) / (2*dx)
      uy = (u(i,j+1) - u(i,j-1)) / (2*dy)
    END DO
  END DO
  call outer(impedance)
  open(1, file = 'heat_map_data.csv', status = 'new')
  do i=1,6
     write(1,*) u(i,1), u(i,2), u(i,3), u(i,4), u(i,5), u(i,6)
  end do
END PROGRAM central_diff
