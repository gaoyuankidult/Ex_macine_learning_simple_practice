%% First Question
clc
clear
cd /media/Study/Introduction_to_Machine_Learning/Excercise/yuan_gao_ex03_2013/mnist
N = 5000;
[X y] = loadmnist(N);
%visual(X(78:123,:));    
%y(78:123);

%% Second Question
%{
 random_pic_array = randsample(5000,100);
 visual(X(random_pic_array,:)); 
 y(random_pic_array)'
%}
 
  %% Third Question
 %%{
 %first_part= randsample(N,N/2);
 first_part= 1:N/2;
 second_part = 1:N;
 second_part = setdiff(second_part,first_part);
 %}
 
 %% Forth Question
 %{
 first_part_traning_labels = containers.Map;
 for i = 1:10
     first_part_traning_labels(int2str(i-1)) = first_part(y(first_part) == i-1);
 end     
 mean_figure = containers.Map;
 for i = 1:10
     mean_figure(int2str(i-1)) = mean(X(first_part_traning_labels(int2str(i-1)),:));
 end
 
names = strtrim(cellstr(num2str((0:9)'))');
d=zeros(length(second_part),10);

tic
for k=1:length(second_part) 
    for i = 1:10
        difference = mean_figure(names{i})-X(second_part(k),:);
        d(k,i) = sqrt(sum(difference.*difference,2)); 
    end
end
toc
%%{
[value,index] = min(d,[],2);
[confusion_matrix,order] = 	confusionmat(y(second_part),index-1)

 %}
 %% Fifth Question
 %{
 d= zeros(length(second_part),length(first_part));
 for i = 1:length(first_part)
     for j = 1:length(second_part)
        difference = X(first_part(i),:)-X(second_part(j),:);
        d(j,i) = sqrt(sum(difference.*difference,2)); 
     end
    if(mod(i,100)==0)
        i
    end 
 end
 [value,index]= min(d,[],2);
 labels = zeros(1,length(second_part));
 for i = 1:length(second_part)
     labels(i) = y(first_part(index(i)));
 end 

[confusion_matrix,order] = 	confusionmat(y(second_part),labels)
%}
%% Fifth Question
1 - trace(confusion_matrix)/2500.0
% Error rate of question 4
% 0.2036

% Error rate of question 5
% 0.0852



    
