function [ choices, count ] = findChoices( in )
%FINDCHOICES Summary of this function goes here
%   Detailed explanation goes here


dx=in.xd-in.x;
dy=in.yd-in.y;

count=0;

% choices:
% [out.Val,Endup Direction; other choices]
choices=zeros(10,2);

%
if dx>0
    if in.theta==0 || in.theta==360
        %out.val=0;
        
        count=count+1;
        choices(count,1)=0;
        choices(count,2)=0;
    end
    if in.theta==90
        %out.val=-1;
        
        count=count+1;
        choices(count,1)=-1;
        choices(count,2)=0;
    end
    if in.theta==270
        %out.val=+1;
        
        count=count+1;
        choices(count,1)=+1;
        choices(count,2)=0;
    end 
end

if dx<0
    if in.theta==180
        %out.val=0;
        
        count=count+1;
        choices(count,1)=0;
        choices(count,2)=180;
    end
    if in.theta==90
        %out.val=+1;
        
        count=count+1;
        choices(count,1)=+1;
        choices(count,2)=180;
    end
    if in.theta==270
        %out.val=-1;
        
        count=count+1;
        choices(count,1)=-1;
        choices(count,2)=180;
    end 
end

if dy>0
    if in.theta==90
        %out.val=0;
        
        count=count+1;
        choices(count,1)=0;
        choices(count,2)=90;
    end
    if in.theta==0 || in.theta==360
        %out.val=+1;
        
        count=count+1;
        choices(count,1)=+1;
        choices(count,2)=90;
    end
    if in.theta==180
        %out.val=-1;
        
        count=count+1;
        choices(count,1)=-1;
        choices(count,2)=90;
    end 
end

if dy<0
    if in.theta==270
        %out.val=0;
        
        count=count+1;
        choices(count,1)=0;
        choices(count,2)=270;
    end
    if in.theta==0 || in.theta==360
        %out.val=-1;
        
        count=count+1;
        choices(count,1)=-1;
        choices(count,2)=270;
    end
    if in.theta==180
        %out.val=+1;
        
        count=count+1;
        choices(count,1)=+1;
        choices(count,2)=270;
    end 
end



end

