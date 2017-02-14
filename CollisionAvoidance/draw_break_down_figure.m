figure 

p1=[3,3];

p2=[12,12];

dp=p2-p1;

p3=[12,3];

dp13=p3-p1;

dp23=p2-p3;



figure(1)
quiver([p1(1),p1(1),p3(1)],[p1(2),p1(2),p3(2)],[dp(1),dp13(1),dp23(1)],[dp(2),dp13(2),dp23(2)],0)
%quiver(p1(1),p1(2),dp13(1),dp13(2),0)
grid
axis([0  20    0  20])
text(p1(1)-.5,p1(2)-.5, sprintf('(%.0f,%.0f)',p1))
text(p2(1),p2(2), sprintf('(%.0f,%.0f)',p2))
text(12,3, sprintf('(12,3)'))
text(6.5,2.5, sprintf('delta x = 9'))
text(12.5,7, sprintf('delta y = 9'))