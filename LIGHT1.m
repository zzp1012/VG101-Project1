classdef LIGHT1
   
    properties
        t;
        o;
        r;
        g;
    end
    
    methods
        function obj = LIGHT1(t,o,r,g)
            obj.t = t;
            obj.o = o;
            obj.r = r;
            obj.g = g;
        end
        
        function shine(obj,x,y)
            ti=rem(obj.t,obj.o+obj.r+obj.g);
            radius=0.25;
            theta=linspace(0,2*pi);
            if ti>0 && ti<=obj.r
                a1=radius*cos(theta)+x;
                b1=radius*sin(theta)+x+y;
                plot(a1,b1,'red')
                fill(a1,b1,'red')
                hold on
                a2=radius*cos(theta)+x+y;
                b2=radius*sin(theta)+x;
                plot(a2,b2,'red')
                fill(a2,b2,'red')
                hold on 
            elseif ti>obj.r && ti<=obj.r+obj.g
                a1=radius*cos(theta)+x;
                b1=radius*sin(theta)+x+y;
                plot(a1,b1,'yellow')
                fill(a1,b1,'yellow')
                hold on
                a2=radius*cos(theta)+x+y;
                b2=radius*sin(theta)+x;
                plot(a2,b2,'yellow')
                fill(a2,b2,'yellow')
                hold on 
            else
                a1=radius*cos(theta)+x;
                b1=radius*sin(theta)+x+y;
                plot(a1,b1,'g')
                fill(a1,b1,'g')
                hold on
                a2=radius*cos(theta)+x+y;
                b2=radius*sin(theta)+x;
                plot(a2,b2,'g')
                fill(a2,b2,'g')
                hold on 
            end    
        end
    end
end

