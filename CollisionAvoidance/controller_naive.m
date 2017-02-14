 function [ out, state ] = controller( in, state )
% Takes flight parameters of an aircraft and outputs the direction control

% in: Data Structure that stores input information for the aircraft
% controller. 
%       (in.x, in.y): Current Location of the aircraft
%       (in.xd, in.yd): Destination of aircraft
%       in.theta: Current direction of motion
%       in.m: Message from neighbouring aircraft 
%           - empty if aircraft not in neighbourhood
%           - (x, y, xd, yd, theta) of other aircraft if non-empty
%           - To access data (say x) from in.m, use in.m.x
%
% out : Data Structure that stores the output information from the aircraft
%       out.val: +1, 0, -1 ( +1 - turn left, 0 - go straight, -1 - turn right)
% 
% state: 
%       any state used by the controller

% This controller simply find the shortest path to the destination,
% do not consider the collision problem.
% This is the implementation of the simple controller

% miles to destination
dx=in.xd-in.x;
dy=in.yd-in.y;

%

if dx>0
    if in.theta==0
        out.val=0;
        return;
    end
    if in.theta==90
        out.val=-1;
        return;
    end
    if in.theta==270
        out.val=+1;
        return;
    end 
end

if dx<0
    if in.theta==180
        out.val=0;
        return;
    end
    if in.theta==90
        out.val=+1;
        return;
    end
    if in.theta==270
        out.val=-1;
        return;
    end 
end

if dy>0
    if in.theta==90
        out.val=0;
        return;
    end
    if in.theta==0
        out.val=+1;
        return;
    end
    if in.theta==180
        out.val=-1;
        return;
    end 
end

if dy<0
    if in.theta==270
        out.val=0;
        return;
    end
    if in.theta==0
        out.val=-1;
        return;
    end
    if in.theta==180
        out.val=+1;
        return;
    end 
end

out.val=+1;

end
