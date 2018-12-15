
classdef CAR
    
    properties
        x;
        y;
        w;
        h;
        p;
    end
    
    methods
        function obj = CAR(x,y,w,h,p)
            obj.x = x;
            obj.y = y;
            obj.w = w;
            obj.h = h;
            obj.p = p;
        end
        
        function t=move(obj,unit,t,o,r,g,x,y,p)
           ti=rem(t,o+r+g);
           pi=randi(100);
           if obj.p==0
               if  ti>0 && ti<=o+r && pi>p
                   judge=0;
               else
                   judge=1;
               end
               if abs(x-obj.x)>=0.5*unit || judge==1 
                   t=1;
               else
                   t=0;
               end     
           elseif obj.p==1
               if ti>0 && ti<=g || pi<=p
                  judge=1;
               else
                  judge=0;
               end
               if abs(obj.y-(x+y))>=0.5*unit || judge==1 
                   t=1;
               else
                   t=0;
               end
           elseif obj.p==2
               if ti>0 && ti<=o+r && pi>p
                   judge=0;
               else
                   judge=1;
               end
               if abs(obj.x-(x+y))>=0.5*unit || judge==1
                   t=1;
               else
                   t=0;
               end             
           else 
                if ti>0 && ti<=g || pi<=p
                   judge=1;
                else
                   judge=0;
                end
                if abs(obj.y-x)>=0.5*unit || judge==1 
                    t=1;
                else 
                    t=0;
                end                
           end
        end
        function figure=show(obj,y,x)
            if obj.p==0 
               figure=rectangle('Position',[obj.x,x+y/8,obj.w,obj.h],'FaceColor','red'); 
               hold on
            elseif obj.p==1
               figure=rectangle('Position',[x+y/8,obj.y,obj.h,obj.w],'FaceColor','yellow');
               hold on
            elseif obj.p==2
               figure=rectangle('Position',[obj.x,x+5*y/8,obj.w,obj.h],'FaceColor','blue');
               hold on
            else 
               figure=rectangle('Position',[x+5*y/8,obj.y,obj.h,obj.w],'FaceColor','cyan'); 
               hold on
            end
        end
    end
end

