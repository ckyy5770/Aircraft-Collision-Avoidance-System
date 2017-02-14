# Aircraft-Collision-Avoidance-System
Hybrid System Project

## Brief Description
The goal of this project is to design an aircraft controller
that navigates the aircraft from source to destination while
ensuring that it does not collide with other aircraft in its
path. The controller gets information about the current location
and the target location of the aircraft. Further, it receives
messages from aircraft in its vicinity and uses this information
to navigate the aircraft and avoid collision with other aircraft


In this project, we will look at a simplified controller design
problem as follows:

* The aircraft will fly in a 2-D plane. Its source and
destination are integer-valued points in the plane.

* The aircraft flies with a constant velocity v=1km/minuate
along either X-axis or Y-axis.

* The aircraft controller can update direction of flight every
k=1 minutes. Note that, it can decide to either fly straight
or rotate left or right by 90 degrees but not turn back.

* At the beginning of every k=1 minutes,

**– The controller can exchange messages with any
aircraft in a square region with side length 2q=4km
(communication zone) in the vicinity of the aircraft
as shown in the figure 1.

**– Based on the messages received and the current state
of the aircraft, the controller can update the direction
of flight
