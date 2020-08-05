function glV3f( x, y, z )
% modified from function glVertex3f(x,y,z)
%
% glVertex3f  Interface to OpenGL function glVertex3f
%
% usage:  glV3f( x, y, z )
%    or:  glV3f([x,y,z])    
%

% 25-Mar-2011 -- created (generated automatically from header files)
% 29-July-2020 - modified

% ---protected---

if nargin==1
    if min(size(x)==[1,3]) || min(size(x)==[3,1])
        y=x(2);
        z=x(3);
        x=x(1);
    else
        error('invalid number of arguments');
    end
elseif nargin~=3
    error('invalid number of arguments');
end

if ~IsGLES
    moglcore( 'glVertex3f', x, y, z );
else
    moglcore( 'ftglVertex3f', x, y, z );
end

return
