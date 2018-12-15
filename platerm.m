function plate=platerm(elements,integar)
elementsletters=elements(~regexp(elements,'\d'));
first=randi(length(elementsletters));
plate=[elementsletters(first)];
for final = 1:integar-1
    randnumber=randi(length(elements);
    platethen=elements(randnumber);    
    plate=[plate,platethen];
end
end