
figure(1)
grid on


quiver([4,6],[6,4],[1,-1],[0,0],0)

text(4.2,6.2, sprintf('vA'))
text(5.6,3.8, sprintf('vB'))

A=[3.5,4.5,1,1]
rectangle('Position',A,'FaceColor',[1 0 0]);
text(3.9,5, sprintf('A'))

B=[5.5,4.5,1,1]
rectangle('Position',B,'FaceColor',[0 0 1]);
text(5.9,5, sprintf('B'))

axis([2 8 2 8]);

grid on