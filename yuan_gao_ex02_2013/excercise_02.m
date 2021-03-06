

%% a)   
clc
cd /media/Study/Introduction_to_Machine_Learning/Excercise/yuan_gao_ex02_2013/movielens
[ratings items userids itemids] = loadmovielens();  

%% b)

%% Test my function
%check_coef_between_two( ratings, items, userids, itemids,1,2)

%% What is the Jaccard coecient between 'Three Colors: Red' and 'Three Colors: Blue'?

%{
movie_a='Three Colors: Red (1994)';
movie_b='Three Colors: Blue (1993)';
for i=1:length(items)
    if(strcmp(items{i},movie_a))
        place1 = i;
    end 
    if (strcmp(items{i},movie_b));
        place2= i;
    end 
end 
coef = check_jacc_coef_between_two( ratings, items, userids, itemids,place1,place2 )
fprintf('Information of these two movies:\n')
for (i = [place1,place2])
    fprintf(1,items{i});
    fprintf(1,'\n');    
end
fprintf('The jaccard coeficient of these two movies is:\n%.5f\n',coef);
%}

%% What are the 5 movies with highest Jaccard coeficient to 'Taxi Driver'?
%%{
movie_a='Taxi Driver (1976)';
top_rank = 5;
top_rank_name = zeros(1,top_rank);
coef_group = zeros(1,top_rank);
for i=1:length(items)
    if(strcmp(items{i},movie_a))
        place1 = i;
    end 
end 
info_container = containers.Map;
i = 1:length(items);
i = i(i~=place1);
for i=i
    coef = check_jacc_coef_between_two( ratings, items, userids, itemids,place1,i);
    info_container(num2str(coef)) = i;
    if coef > coef_group(1)
        fprintf('%f',coef);
        fprintf('\n');
        fprintf(1,items{info_container(num2str(coef))});
        fprintf('\n');
        coef_group(1) = coef;
        coef_group = sort(coef_group);
        %top_rank_name(1) = i;
    end  

     
end 
coef_group = sort(coef_group)
fprintf('5 movies with highest Jaccard coeficient to Taxi Driver are :\n');
for coef = coef_group
    fprintf(1,items{info_container(num2str(coef))});
    fprintf('\n');
end 
%}

%% Select a movie of your own choosing (which you are familiar with), what are the 5 movies with highest Jaccard coeicient to that movie ?
%{
movie_a='Star Wars (1977)';
top_rank = 5;
top_rank_name = zeros(1,top_rank);
coef_group = zeros(1,top_rank);
for i=1:length(items)
    if(strcmp(items{i},movie_a))
        place1 = i;
    end 
end 
info_container = containers.Map;
i = 1:length(items);
i = i(i~=place1);
for i=i
    coef = check_jacc_coef_between_two( ratings, items, userids, itemids,place1,i);
            info_container(num2str(coef)) = i;
    if coef > coef_group(1)
        coef_group(1) = coef;
        coef_group = sort(coef_group);
    end  
end 
coef_group = sort(coef_group);
coef_group
fprintf('5 movies with highest Jaccard coeficient to Star Wars (1977) are :\n');
for coef = coef_group
    if coef ~= 0
        fprintf(1,items{info_container(num2str(coef))});
        fprintf('\n');
    else 
        fprintf('Invalid\n');
    end 
end 
%}

%% Do they make sense?

% That do makes sense, geeks like geeky movies.

%% c)

%% What is now the similarity between 'Toy Story' and 'GoldenEye'?

%coef = check_corre_coef_between_two( ratings, items, userids, itemids,1,2)

%% How about 'Three Colors: Red' and 'Three Colors: Blue'?
%{
movie_a='Three Colors: Red (1994)';
movie_b='Three Colors: Blue (1993)';
for i=1:length(items)
    if(strcmp(items{i},movie_a))
        place1 = i;
    end 
    if (strcmp(items{i},movie_b));
        place2= i;
    end 
end 
coef = check_corre_coef_between_two( ratings, items, userids, itemids,place1,place2)
%}

%% What are the 5 movies with highest similarity to 'Taxi Driver'?
%{
movie_a='Taxi Driver (1976)';
top_rank = 5;
top_rank_name = zeros(1,top_rank);
coef_group = zeros(1,top_rank);
for i=1:length(items)
    if(strcmp(items{i},movie_a))
        place1 = i;
    end 
end 
info_container = containers.Map;
i = 1:length(items);
i = i(i~=place1);
for i=i
    coef = check_corre_coef_between_two( ratings, items, userids, itemids,place1,i);
            info_container(num2str(coef)) = i;
    if coef > coef_group(1)
        
        coef_group(1) = coef;
        coef_group = sort(coef_group);
        %top_rank_name(1) = i;
    end  
end 
coef_group = sort(coef_group)
fprintf('5 movies with highest Jaccard coeficient to Taxi Driver are :\n');
for coef = coef_group
    fprintf(1,items{info_container(num2str(coef))});
    fprintf('\n');
end 
%}

%% Select a movie of your own choosing (which you are familiar with), what are the 5 movies with highest Jaccard coeicient to that movie ?
%{
movie_a='Star Wars (1977)';
top_rank = 5;
top_rank_name = zeros(1,top_rank);
coef_group = zeros(1,top_rank);
for i=1:length(items)
    if(strcmp(items{i},movie_a))
        place1 = i;
    end 
end 
info_container = containers.Map;
i = 1:length(items);
i = i(i~=place1);
for i=i
    coef = check_corre_coef_between_two( ratings, items, userids, itemids,place1,i);
            info_container(num2str(coef)) = i;
    if coef > coef_group(1)
        coef_group(1) = coef;
        coef_group = sort(coef_group);
    end  
end 
coef_group = sort(coef_group);
fprintf('5 movies with highest correlation coeficient to Star Wars (1977) are :\n');
coef_group
for coef = coef_group
    if coef ~= 0
        fprintf(1,items{info_container(num2str(coef))});
        fprintf('\n');
    else 
        fprintf('Invalid\n');
    end 
end 
%}


%% (d) Provide some brief thoughts on which similarity measure seems to work `better', in the sense that the  computed similarity matches your intuitive sense of similarity. Explain.