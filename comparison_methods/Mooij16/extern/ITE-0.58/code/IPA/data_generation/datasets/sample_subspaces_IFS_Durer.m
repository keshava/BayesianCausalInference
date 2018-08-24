function [e] = sample_subspaces_IFS_Durer(num_of_samples,n_v)
%function [e] = sample_subspaces_IFS_Durer(num_of_samples,n_v)
%Sampling from the Durer n-gon. Number of samples: num_of_samples. Multiple n values can be given in vector n_v.
%
%OUTPUT:
%   e: e(:,t) is the t^th sample. size(e,2) = num_of_samples.
%EXAMPLE:
%   e = sample_subspaces_IFS_Durer(10000,[5:8]);

%Copyright (C) 2012- Zoltan Szabo ("http://www.gatsby.ucl.ac.uk/~szabo/", "zoltan (dot) szabo (at) gatsby (dot) ucl (dot) ac (dot) uk")
%
%This file is part of the ITE (Information Theoretical Estimators) toolbox.
%
%ITE is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
%
%This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License along with ITE. If not, see <http://www.gnu.org/licenses/>.

e = zeros(2*length(n_v),num_of_samples);
k = 0;
for n = n_v
    k = k + 1;
    [f,p,x1] =  f_Durer_n_gon(n);    
    e(2*k-1:2*k,:) = sample_subspaces_IFS_iteration(f,p,num_of_samples,x1);
end  

%----------------------------------
function [f,p,x1] = f_Durer_n_gon(n)
%Returns IFS (f), probability distribution (p) and initial point (x1) of a
%Durer's Pentagon (n-gon).

%p:
    p = ones(1,n+1)/(n+1);
%f:
    %r:
        K = floor(n/4);
        r = 1/(2*(1+sum(cos(2*pi/n*[1:K]))));
    %Generation of the different A, b values (to f):    
        w = 10;
        for k = 1 : n
            f{k}.A = r * eye(2);
            f{k}.b = (1-r) * w * [cos((2*pi*k)/n);sin((2*pi*k)/n)];
        end
        f{n+1}.A = r * eye(2);
        f{n+1}.b = [0;0];
%x1:    
    x1 = [.5;.5];    