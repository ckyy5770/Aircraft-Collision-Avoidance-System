function [ turn_new,endDir ] = takeTheOtherChoice( choices,turn )
%TAKETHEOTHERCHOICE Summary of this function goes here
%   Detailed explanation goes here

if turn==choices(1,1)
    turn_new=choices(2,1);
    endDir=choices(2,2);
else
    turn_new=choice(1,1);
    endDir=choices(1,2);
end

end

