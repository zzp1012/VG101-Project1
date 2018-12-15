x=input('the length of the road :');
y=input('the width of the road :');
o=input('the time of orange light:(integar)');
g=input('the time of green light:(integar)');
red=input('the time of red light:(integar)');
n=input('the number of the car:');
v=input('the velocity of the car:');
p=input('the probability of the car to cross the crossing during the red lights, just input the percentage(integar):');
elements=input('the elements you want to input','s');
integar=input('a integar to show the length of the plate');

ranf=rani(n);
n1=ranf(:,1);
n2=ranf(:,2);
n3=ranf(:,3);
n4=ranf(:,4);
nx=max(ranf);

plot([0,x],[x+y,x+y],'-k','LineWidth',3);
hold on
plot([x+y,x+x+y],[x+y,x+y],'-k','LineWidth',3);
hold on 
plot([x,x],[x+y,2*x+y],'-k','LineWidth',3);
hold on 
plot([x+y,x+y],[x+y,2*x+y],'-k','LineWidth',3);
hold on
plot([0,x],[x,x],'-k','LineWidth',3);
hold on
plot([x+y,x+x+y],[x,x],'-k','LineWidth',3);
hold on 
plot([x+y,x+y],[0,x],'-k','LineWidth',3);
hold on
plot([x,x],[0,x],'-k','LineWidth',3);
hold on
plot([0,x],[x+y/2,x+y/2],'--k','LineWidth',1);
hold on 
plot([x+y,x+x+y],[x+y/2,x+y/2],'--k','LineWidth',1);
hold on
plot([x+y/2,x+y/2],[x+y,2*x+y],'--k','LineWidth',1);
hold on
plot([x+y/2,x+y/2],[0,x],'--k','LineWidth',1);
hold on

CAR1=[];
w=x/(2*nx);
unit=v;
wx=[0];
for i1=1:n1
 car=CAR(wx(i1),x+y/8,w,y/4,0);
 CAR1=[CAR1;car];
 wxthen=wx(i1)-x/nx;
 wx=[wx;wxthen];
end
CAR2=[];
ny=[2*x+y-x/(2*nx)];
for i2=1:n2
 car=CAR(x+y/8,ny(i2),w,y/4,1);
 CAR2=[CAR2;car];
 nythen=ny(i2)+x/nx;
 ny=[ny;nythen];
end
CAR3=[];
ex=[2*x+y-x/(2*nx)];
for i3=1:n3
 car=CAR(ex(i3),x+5*x/y,w,y/4,2);
 CAR3=[CAR3;car];
 exthen=ex(i3)+x/nx;
 ex=[ex;exthen];
end
CAR4=[];
sy=[0];
for i4=1:n4
 car=CAR(x+5*y/8,sy(i4),w,y/4,3);
 CAR4=[CAR4;car];
 sythen=sy(i4)-x/nx;
 sy=[sy;sythen];
end

t=0;
shuzu=[wx;2*x+y-ny;2*x+y-ex;sy];
edge=min(shuzu);
while edge<=2*x+y
     light1=LIGHT1(t,o,red,g);
     light2=LIGHT2(t,o,red,g);
     figure1=[];
     for j1=1:n1
         figure=CAR1(j1).show(y,x);
         figure1=[figure1;figure];
     end
     figure2=[];
     for j2=1:n2
         figure=CAR2(j2).show(y,x);
         figure2=[figure2;figure];
     end
     figure3=[];
     for j3=1:n3
         figure=CAR3(j3).show(y,x);
         figure3=[figure3;figure];
     end
     figure4=[];
     for j4=1:n4
         figure=CAR4(j4).show(y,x);
         figure4=[figure4;figure];
     end
     t1=[1];
     for k1=1:n1
         t1then=CAR1(k1).move(unit,t,o,red,g,x,y,p);
         if t1then==1 && t1(k1)==1
             wx(k1)=wx(k1)+v;
         else
             wx(k1)=wx(k1);
             t1then=0;
         end
         CAR1(k1)=CAR(wx(k1),x+y/8,w,y/4,0);
         t1=[t1;t1then];
     end
     t2=[1];
     for k2=1:n2
         t2then=CAR2(k2).move(unit,t,o,red,g,x,y,p);
         if t2then==1 && t2(k2)==1
             ny(k2)=ny(k2)-v;
         else
             ny(k2)=ny(k2);
             t2then=0;
         end
         CAR2(k2)=CAR(x+y/8,ny(k2),w,y/4,1);
         t2=[t2;t2then];
     end
     t3=[1];
     for k3=1:n3
         t3then=CAR3(k3).move(unit,t,o,red,g,x,y,p);
         if t3(k3)==1 && t3then==1
             ex(k3)=ex(k3)-v;
         else
             ex(k3)=ex(k3);
             t3then=0;
         end
         CAR3(k3)=CAR(ex(k3),x+5*y/8,w,y/4,2);
         t3=[t3;t3then];
     end
     t4=[1];
     for k4=1:n4
         t4then=CAR4(k4).move(unit,t,o,red,g,x,y,p);
         if t4then==1 && t4(k4)==1
             sy(k4)=sy(k4)+v;
         else
             sy(k4)=sy(k4);
             t4then=0;
         end
         CAR4(k4)=CAR(x+5*y/8,sy(k4),w,y/4,3);
         t4=[t4;t4then];
     end
     light1.shine(x,y);
     light2.shine(x,y);
     pause(1);
     t=t+1;
     for f1=1:n1
         delete(figure1(f1));
     end
     for f2=1:n2
         delete(figure2(f2));
     end
     for f3=1:n3
         delete(figure3(f3));
     end
     for f4=1:n4
         delete(figure4(f4));
     end  
     shuzu=[wx(1:n1);(2*x+y)-ny(1:n2);2*x+y-ex(1:n3);sy(1:n4)];
     edge=min(shuzu);
     judge=0;
     for break11=1:n1
         for break12=1:n2
             if wx(break11)<x+y/8 && x+y/8<wx(break11)+w && ny(break12)>x+y/8 && ny(break12)<x+y/8+y/4
                 judge=1;
                 break
             end
         end
         if judge==1
             break     
         end
     end
     for break21=1:n1
         for break22=1:n3
             if wx(break21)<ex(break22) && ex(break22)<wx(break21)+w
                 judge=1;
                 break
             end
         end
         if judge==1
             break     
         end
     end
     for break31=1:n1
         for break32=1:n4
             if wx(break31)<x+5*y/8 && wx(break31)+w>x+5*y/8 && sy(break32)+w>x+y/8 && sy(break31)+w<x+y/8+y/4
                 judge=1;
                 break
             end
         end
         if judge==1
             break     
         end
     end
     for break41=1:n2
         for break42=1:n3
             if ny(break41)>x+y/8 && ny(break42)<x+y/8+y/4 && ex(break42)<x+y/8+y/4 && ex(break42)>x+y/8
                 judge=1;
                 break
             end
         end
          if judge==1
             break     
         end
     end
     for break51=1:n2
         for break52=1:n4
             if ny(break51)>sy(break52) && ny(break51)<sy(break52)+w
                 judge=1;
                 break
             end
         end
          if judge==1
             break     
         end
     end
     for break61=1:n3
         for break62=1:n4
             if ex(break61)>x+5*x/8 && ex(break61)<x+5*x/8+y/4 && sy(break62)+w>x+5*x/8 && sy(break62)<x+5*x/8
                 judge=1;
                 break
             end
         end
          if judge==1
             break     
         end
     end
     if judge==1
         break
     end
     PLATE=[];
     if t==(2*x+y)/v
         for i=1:n1
             if wx(i)==x+x+y
                 plate=platerm(elements,integar);
                 PLATE=[PLATE;plate];
             end
         end
          for i=1:n2
             if ny(i)==0
                 plate=platerm(elements,integar);
                 PLATE=[PLATE;plate];
             end
          end
          for i=1:n3
             if ex(i)==0
                 plate=platerm(elements,integar);
                 PLATE=[PLATE;plate];
             end
          end
          for i=1:n4
             if sy(i)==x+x+y
                 plate=platerm(elements,integar);
                 PLATE=[PLATE;plate];
             end
          end
         fprintf(PLATE);
     end
end
 
function ranf=rani(n)
zt=[];
for i1=1:n
    for i2=1:n-i1
        for i3=1:n-i1-i2-1
            i4=n-i1-i2-i3;
            z=[i1,i2,i3,i4];
            zt=[zt;z];
        end
    end
end
ran=randi(size(zt,1));
ranf=zt(ran,:);
end 

        


        


        


