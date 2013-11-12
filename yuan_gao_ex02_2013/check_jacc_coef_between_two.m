function coef = check_jacc_coef_between_two( ratings, items, userids, itemids,itemid1, itemid2 )
% max item id
N = max(itemids);
% sums array [0,0...,0] total N numbers

array_of_people=zeros(1,N);
for i=1:length(ratings)
    % get people id
    pnd = ratings(i,1);  
    % get item id    
    ind = ratings(i,2);       
    if(ind == itemid1)  
        array_of_people(pnd) = array_of_people(pnd) + 1;
    end 
    if(ind == itemid2)  
        array_of_people(pnd) = array_of_people(pnd) + 1;
    end 
end

people_rated_both = length(array_of_people(array_of_people==2));
cnt = hist(ratings(:,2),max(itemids));
coef = people_rated_both/(cnt(itemid1) + cnt(itemid2) - people_rated_both);

