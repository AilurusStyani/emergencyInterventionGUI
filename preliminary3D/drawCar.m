function drawCar(position)
global TRIALINFO;
global GL;

glBegin(GL.LINES);

%     6-----7
%    /|    / |
%  1-----2  |
%  |  |  |   |
%  |  5- - -8
%  | /   | /
%  4---- 3

%1-2
glV3f(position+TRIALINFO.carSize.*[-0.5, 1,  0.5]);
glV3f(position+TRIALINFO.carSize.*[ 0.5, 1,  0.5]);
%2-3
glV3f(position+TRIALINFO.carSize.*[ 0.5, 1,  0.5]);
glV3f(position+TRIALINFO.carSize.*[ 0.5, 0,  0.5]);
%3-4
glV3f(position+TRIALINFO.carSize.*[ 0.5, 0,  0.5]);
glV3f(position+TRIALINFO.carSize.*[-0.5, 0,  0.5]);
%4-5
glV3f(position+TRIALINFO.carSize.*[-0.5, 0,  0.5]);
glV3f(position+TRIALINFO.carSize.*[-0.5, 0, -0.5]);
%5-6
glV3f(position+TRIALINFO.carSize.*[-0.5, 0, -0.5]);
glV3f(position+TRIALINFO.carSize.*[-0.5, 1, -0.5]);
%6-7
glV3f(position+TRIALINFO.carSize.*[-0.5, 1, -0.5]);
glV3f(position+TRIALINFO.carSize.*[ 0.5, 1, -0.5]);
%7-8
glV3f(position+TRIALINFO.carSize.*[ 0.5, 1, -0.5]);
glV3f(position+TRIALINFO.carSize.*[ 0.5, 0, -0.5]);
%8-5
glV3f(position+TRIALINFO.carSize.*[ 0.5, 0, -0.5]);
glV3f(position+TRIALINFO.carSize.*[-0.5, 0, -0.5]);
%1-6
glV3f(position+TRIALINFO.carSize.*[-0.5, 1,  0.5]);
glV3f(position+TRIALINFO.carSize.*[-0.5, 1, -0.5]);
%2-7
glV3f(position+TRIALINFO.carSize.*[ 0.5, 1,  0.5]);
glV3f(position+TRIALINFO.carSize.*[ 0.5, 1, -0.5]);
%3-8
glV3f(position+TRIALINFO.carSize.*[ 0.5, 0,  0.5]);
glV3f(position+TRIALINFO.carSize.*[ 0.5, 0, -0.5]);
%1-4
glV3f(position+TRIALINFO.carSize.*[-0.5, 1,  0.5]);
glV3f(position+TRIALINFO.carSize.*[-0.5, 0,  0.5]);

glEnd();

end