function [Xp,Yp,Zp,Cp,Xs,Ys,Zs] = pumpkinFunction(w,h)

% Pumpkin
bumps = 10; bdepth = 0.1; bdepth2 = 0.02; dimple = 0.5;
width_r = w; height_r = h;
[Xs, Ys, Zs] = sphere(199);
Rxy = (0-(1-mod(linspace(0,bumps*2,200),2)).^2)*bdepth + (0-(1-mod(linspace(0,bumps*4,200),2)).^2)*bdepth2;
Rz = (0-linspace(1,-1,200)'.^4)*dimple;
Xp = (width_r+Rxy).*Xs;
Yp = (width_r+Rxy).*Ys;
Zp = (height_r+Rz).*Zs.*(Rxy+1);
Cp = hypot(hypot(Xp,Yp),width_r.*Zs.*(Rxy+1));

% Stem
sheight = 0.5; scurve = 0.4;
srad = [ 1.5 1 repelem(.7, 6) ] .* [ repmat([.1 .06],1,bumps) .1 ]';
[theta, phi] = meshgrid(linspace(0,pi/2,size(srad,2)),linspace(0,2*pi,size(srad,1)));
Xs = (scurve-cos(phi).*srad).*cos(theta)-scurve;
Zs = (sheight-cos(phi).*srad).*sin(theta) + height_r-max(0,dimple*.9);
Ys = -sin(phi).*srad;
end

