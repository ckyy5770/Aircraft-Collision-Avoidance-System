function [ res ] = nextPos( in, turn )
%NEXTPOS Summary of this function goes here
%   Detailed explanation goes here
k=1;
v=1;

theta = wrapTo360(turn*90 + in.theta);

if(in.x == in.xd && in.y == in.yd)
    res.x = in.x;
    res.y = in.y;
elseif(theta == 0 || theta == 360)
    res.x = in.x + k*v;
    res.y = in.y;
elseif(theta == 90)
    res.y = in.y + k*v;
    res.x = in.x;
elseif(theta == 180)
    res.x = in.x - k*v;
    res.y = in.y;
elseif(theta == 270)
    res.y = in.y - k*v;
    res.x = in.x;
end
res.theta=theta;
end

