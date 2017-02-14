
figure(1)
grid on


quiver([4,6],[6,3.5],[1,0],[0,1],0)

text(4.2,6.2, sprintf('vA'))
text(5.7,3.8, sprintf('vB'))

A=[3.5,4.5,1,1]
rectangle('Position',A,'FaceColor',[1 0 0]);
text(3.9,5, sprintf('A'))


C=[4.5,3.5,1,1]
rectangle('Position',C,'FaceColor',[0 1 0]);
text(4.9,4, sprintf('C'))

axis([2 8 2 8]);

grid on