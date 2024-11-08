clc
clear
close all

figure(1);
view([1,2,1]);
fh=gcf;
axis equal
hold on
elips_tan(fh,[0,0,0],2,[1,1,2],[-1,1])

elips_tan(fh,[-5,0,0],2,[-1,2,1],[6,1])

p1 = [2,0,3];
p2 = [4,0,3];
plot_arrow3d(p1,p2,60,0.5,[1,0,5]);
function elips_tan(fh,center,R,axis,p0xy)
% fh : figure handle
% center : center position
% R : radius
% axis : axis length
% p0xy : target point [x,y] for tangent plane
syms r [1 3] real
f = (r-center)*diag(axis)*(r-center).';
feqn = f==R^2;%symmatrix2sym(f == 2);
fimplicit3(feqn,'EdgeColor','none')

fgrad = gradient(f,r);
r0 = p0xy;
tmp = solve(subs(f,[r1,r2],r0)==R^2,r3);
r0 = [r0,tmp(end)];
fplane = (r-r0)*subs(fgrad,r,r0);
plot3(r0(1),r0(2),r0(3),'ro',MarkerSize = 2,MarkerFaceColor = 'r')
fs=fimplicit3(fplane == 0);
fs.XRange=[-1,1]+p0xy(1);
fs.YRange=[-1,1]+p0xy(2);
fh.Children.Children(1).FaceAlpha=0.8;
end
%%


[Mx,My,Mz] = ellipsoid(0,0,0,1,1,2);
surf(Mx, My, Mz);
colormap(gca,winter)
fh=gcf;
daspect([1,1,1])
hold on
[Nx,Ny,Nz] = ellipsoid(5,0,0,1,2,1);
surf(Nx, Ny, Nz);
%fh.Children.Children(1).FaceColor='b';
fh.Children.Children(2).FaceColor='g';
fh.Children.Children(2).FaceAlpha=0.4;



