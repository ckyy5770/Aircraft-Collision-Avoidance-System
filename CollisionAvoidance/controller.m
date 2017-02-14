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

out.val=0;
if in.x==6 && in.y==6
    1;
end

% if there is no message, just make sure it is on the fastest route to
% destination
if isempty(in.m) %|| in.m.state.flag==true
    % find all choices the aircraft have to be on a shortest path
    [choices, count] = findChoices(in);
    % pick one choice depending on preference rules we define in the
    % function
    out.val=choiceSelection(choices, count);
    return;
else
    % here we find a aircraft in the vicinity
    % first we should detect is there a potential collision in the next
    % step, by calculating the position of next step just like usual
    
    
    [choices1, count1] = findChoices(in);
    turn1=choiceSelection(choices1, count1);
    res_1 = nextPos(in, turn1);
    
    [choices2, count2] = findChoices(in.m);
    turn2=choiceSelection(choices2, count2);
    res_2 = nextPos(in.m, turn2);
    
    if res_1.x==res_2.x && res_1.y==res_2.y
        % here comes a collision
        
        % if it is a collision that face to face
        if abs(res_1.theta - res_2.theta)==180
            % if one of them have another choice
            % take it in the next step
            if count1==2 && (count2==1||count2==0)
                % this aircraft should modify its path
                [out.val,~]=takeTheOtherChoice(choices1,turn1);
                return;
            end
            if count2==2 && (count1==1||count1==0)
                % the other aircraft already modified its path
                out.val=turn1;
                return;
            end
            if count1==2 && count2==2
                % in this case, one of the aircraft should modify its path
                % we define the one with higher theta should modify its
                % path, and the other one just keep going
                if res_1.theta>res_2.theta
                    [out.val,~]=takeTheOtherChoice(choices1,turn1);
                    return;
                else
                    out.val=turn1;
                    return;
                end
            end
            % if there is only one choice, just make a turn,
            %we define the one with higher theta should modify its
            % path, and the other one just keep going
            if res_1.theta>res_2.theta
                out.val=+1;
                if out.val==turn1;
                    out.val=0;
                end
                return;
            else
                out.val=turn1;
                return;
            end
        else
            % the collision is not face to face
            % if one of them have another choice and this choice result in
            % a direction that is opposite of the other
            % take it in the next step
            if count1==2 && (count2==1||count2==0)
                [turn_new,endDir]=takeTheOtherChoice(choices1,turn1);
                if abs(endDir-res_2.theta)==180
                    out.val=turn_new;
                    return;
                end
            end
            if count2==2 && (count1==1||count1==0)
                [~,endDir]=takeTheOtherChoice(choices2,turn2);
                % in this case, the other aircraft has already modified its
                % path, we just need to keep going
                if abs(endDir-res_1.theta)==180
                    out.val=turn1;
                    return;
                end
            end
            if count1==2 && count2==2
                [turn_new1,endDir1]=takeTheOtherChoice(choices1,turn1);
                [~,endDir2]=takeTheOtherChoice(choices2,turn2);
                % in this case, two aircraft can modify their path, we just
                % let the one with higher theta modify its and set a flag to pervent
                % the other's modification
                if abs(endDir1-res_2.theta)==180 && abs(endDir2-res_1.theta)==180
                    if res_1.theta>res_2.theta
                        out.val=turn_new1;
                        return;
                    else
                        out.val=turn1;
                        return;
                    end
                end
            end
            % if there are no better choice, simply let the one with higher theta turn
            % to the opposite direction of the other, and set the flag
            if res_1.theta>res_2.theta
                new_dir=wrapTo360(res_2.theta-180);
                if (new_dir-in.theta)==90 || (new_dir-in.theta)==-270
                    out.val=+1;
                elseif (new_dir-in.theta)==-90 || (new_dir-in.theta)==270
                    out.val=-1;
                elseif (new_dir-in.theta)==0 ||(new_dir-in.theta)==360
                    out.val=0;
                end
                return;
            else
                out.val=turn1;
                return;
            end
        end
    else
        % no collision, just as usual
        out.val=turn1;
        return;
    end
    
end



end
