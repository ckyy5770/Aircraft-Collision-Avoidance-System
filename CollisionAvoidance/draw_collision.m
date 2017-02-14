
figure(1)
grid on
A=[4.5,4.5,1,1]
rectangle('Position',A,'FaceColor',[1 0 0]);
text(4.9,5, sprintf('A'))

B=[5.5,5.5,1,1]
rectangle('Position',B,'FaceColor',[0 1 0]);
text(5.9,6, sprintf('B'))


C=[3.5,3.5,1,1]
rectangle('Position',C,'FaceColor',[0 1 0]);
text(3.9,4, sprintf('C'))

D=[3.5,5.5,1,1]
rectangle('Position',D,'FaceColor',[0 1 0]);
text(3.9,6, sprintf('C'))

E=[5.5,3.5,1,1]
rectangle('Position',E,'FaceColor',[0 1 0]);
text(5.9,4, sprintf('E'))




F=[4.5,5.5,1,1]
rectangle('Position',F,'FaceColor',[0 0 1]);
text(4.9,6, sprintf('F'))

G=[4.5,3.5,1,1]
rectangle('Position',G,'FaceColor',[0 0 1]);
text(4.9,4, sprintf('G'))

H=[3.5,4.5,1,1]
rectangle('Position',H,'FaceColor',[0 0 1]);
text(3.9,5, sprintf('H'))

I=[5.5,4.5,1,1]
rectangle('Position',I,'FaceColor',[0 0 1]);
text(5.9,5, sprintf('I'))

axis([2 8 2 8]);