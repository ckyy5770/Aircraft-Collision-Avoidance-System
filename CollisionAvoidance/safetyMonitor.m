function [ flag ] = safetyMonitor( in1, in2 )
% in1, in2: Data Structure that stores information about the aircraft
%       (x, y): Current Location of the aircraft
%       (xd, yd): Destination of aircraft
%       theta: Current direction of motion
%       m: Message from neighbouring aircraft 
%           - empty if aircraft not in neighbourhood
%           - (x, y, xd, yd, theta) of other aircraft if non-empty
%
% flag: true if the safety is voilated and false otherwise.

% dx=abs(in(1).x-in(2).x);
% dy=abs(in(1).y-in(2).y);
% 
% if dx<=1 && dy<=1
%     flag=false;
% else
%     flag=true;
% end


if in1.x==in2.x && in1.y==in2.y
    flag=true;
else
    flag=false;
end

end

