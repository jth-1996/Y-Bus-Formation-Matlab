% d = [ branch_no  from_bus to_bus impedance;]
d = [ 1 1 5 0.365; 2 1 4 0.605; 3 1 3 0.55; 4 1 2 0.34; 5 2 5 0.10; 6 3 2 0.675; 7 3 5 0.75; 8 3 4 1; 9 4 2 0.39; 10 4 5 0.355]
%m = [ branch_no  branch_no  coupling_impedance;]
m=[0 0 0]
% z matrix formation
zp = d( : , 4)
z = diag ( zp , 0)
% adding mutual coupling impedance to Z matrix
f_branch = m ( : , 1 )
t_branch = m ( : , 2 )
zm = m ( : , 3 )
n_zm = size (zm);
n_zm = n_zm ( 1 , 1)
for j = 1:n_zm
   z( f_branch( j ), t_branch( j ) ) = zm ( j )
   z( t_branch( j ), f_branch( j ) ) = zm ( j )
end
%Incidence matrix formation
nbr = max ( d (  : , 1 ))
nb = max ( d (  : , 2 ) , d (  : , 3 ) )
f_bus = d ( : , 2)
t_bus = d ( : , 3)
yp = inv( z )
A= zeros( nb , nbr )
for j = 1 : nb
    for k = 1:nbr
        if t_bus( k ) = = j
           A( j , k) = -1
        else if f_bus( k ) == j
           A( j , k ) = 1
         else
             end
      end
end
% Y bus formation
Y = A * yp * transpose ( A )