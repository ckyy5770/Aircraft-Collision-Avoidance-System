function [ turn, endingDir ] = choiceSelection(  choices, count )
%CHOICESELECTION Summary of this function goes here
%   Detailed explanation goes here
    
    % choice preference
    % according to the logic, there are up to two choices
    % and if there are two, the first one should be along x-axis. 
    if count==0
        turn=+1;
    elseif count==1
        turn=choices(1,1);
    elseif count==2
        % x-axis preference
        turn=choices(1,1);
    end 
end

