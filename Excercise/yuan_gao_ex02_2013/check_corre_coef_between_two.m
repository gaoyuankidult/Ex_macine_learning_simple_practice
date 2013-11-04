function coef = check_corre_coef_between_two( ratings, items, userids, itemids,itemid1, itemid2 )
% max item id
% sums array [0,0...,0] total N numbers
all_record_1 = ratings(ratings(:,2)==itemid1,:);
all_record_2 = ratings(ratings(:,2)==itemid2,:);
id_user1 =all_record_1(:,1);
id_user2 =all_record_2(:,1);
[both_id, index_a,index_b] = intersect(id_user1,id_user2);
record_item1 = all_record_1(index_a,:);
record_item2 = all_record_2(index_b,:);
record_item1 = sortrows(record_item1,1);
record_item2 = sortrows(record_item2,1);

if (length(record_item1(:,3)) <= 20)
    coef = 0;
    return
end 
coef_matrix = corrcoef(record_item1(:,3),record_item2(:,3));
coef= coef_matrix(1,2);
 




%people_rated_both = length(array_of_people(array_of_people==2));
%cnt = hist(ratings(:,2),max(itemids));
%coef = people_rated_both/(cnt(itemid1) + cnt(itemid2) - people_rated_both);

 