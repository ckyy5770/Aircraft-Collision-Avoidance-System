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


% % Initialize state
% if (isempty(state))
%     state.mode = 0; 
% end
% 
% % Code to generate controller output
% if (state.mode == 0)
%     out.val = +1;
%     state.mode = 1;
% elseif (state.mode == 1)
%     out.val = 0;
%     state.mode = 0;
% end

% miles to destination
dx=in.xd-in.x;
dy=in.yd-in.y;

count=0;

% choices:
% [out.Val,Endup Direction; other choices]
choices=zeros(10,2);


%
if dx>0
    if in.theta==0 || in.theta==360
        out.val=0;
        
        count=count+1;
        choices(count,1)=0;
        choices(count,2)=0;
    end
    if in.theta==90
        out.val=-1;
        
        count=count+1;
        choices(count,1)=-1;
        choices(count,2)=0;
    end
    if in.theta==270
        out.val=+1;
        
        count=count+1;
        choices(count,1)=+1;
        choices(count,2)=0;
    end 
end

if dx<0
    if in.theta==180
        out.val=0;
        
        count=count+1;
        choices(count,1)=0;
        choices(count,2)=180;
    end
    if in.theta==90
        out.val=+1;
        
        count=count+1;
        choices(count,1)=+1;
        choices(count,2)=180;
    end
    if in.theta==270
        out.val=-1;
        
        count=count+1;
        choices(count,1)=-1;
        choices(count,2)=180;
    end 
end

if dy>0
    if in.theta==90
        out.val=0;
        
        count=count+1;
        choices(count,1)=0;
        choices(count,2)=90;
    end
    if in.theta==0 || in.theta==360
        out.val=+1;
        
        count=count+1;
        choices(count,1)=+1;
        choices(count,2)=90;
    end
    if in.theta==180
        out.val=-1;
        
        count=count+1;
        choices(count,1)=-1;
        choices(count,2)=90;
    end 
end

if dy<0
    if in.theta==270
        out.val=0;
        
        count=count+1;
        choices(count,1)=0;
        choices(count,2)=270;
    end
    if in.theta==0 || in.theta==360
        out.val=-1;
        
        count=count+1;
        choices(count,1)=-1;
        choices(count,2)=270;
    end
    if in.theta==180
        out.val=+1;
        
        count=count+1;
        choices(count,1)=+1;
        choices(count,2)=270;
    end 
end

% choice preference
% according to the logic, there are up to two choices
% and if there are two, the first one should be along x-axis.

if count==0
    out.val=+1;
elseif count==1
    out.val=choices(1,1);
elseif count==2
    % x-axis preference
    out.val=choices(1,1);
end




end
