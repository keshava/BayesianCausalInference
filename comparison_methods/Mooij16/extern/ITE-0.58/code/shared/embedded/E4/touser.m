function din = touser(din,userf, userfg)
% touser   - Activates the user model indicator in DIN and
%            adds the user function.
%    din = touser(din,userf, userfg)
%    userf < name of user function
%    userfg < name of user function for building derivatives (not required)
%
% 29/4/97

% Copyright (C) 1997 Jaime Terceiro
% 
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2, or (at your option)
% any later version.
% 
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details. 
% 
% You should have received a copy of the GNU General Public License
% along with this file.  If not, write to the Free Software Foundation,
% 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

[H_D, type, m, r, s, n, np, userflag, ign, isinnov, szpriv] = e4gthead(din);

if nargin > 2
   userflag = 2;
   userf = e4strmat(userf, userfg);
else
   userflag = 1;
end
din(1:H_D) = e4sthead(type, m, r, s, n, np, userflag, userf, isinnov, szpriv);
