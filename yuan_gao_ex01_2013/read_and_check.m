function[dimensions,sum_of_matrix] = read_and_check(file_name)

a=dlmread(file_name);
figure(4)
subplot(1,2,1)
bar(sum(a,1));
title('Column  sum of the matrix');
subplot(1,2,2)
bar(sum(a,2));
title('Row sum of the matrix');
dimensions = size(a);
sum_of_matrix = sum(a);

end