
%% Exercise 1. Generate 100 samples from a normal distribution with zero mean and unit variance.
% (a) Visualize the data by drawing a histogram.
mu = 0; 
sigma = 1; 
r = normrnd(mu,sigma,100,1)
pdf_normal = normpdf(r, mu, sigma); 
figure(1)
hist(r);

% (b) Sort the data points into increasing order.
r=sort(r);
pdf_normal = normpdf(r, mu, sigma); 
figure(2)
plot(r, pdf_normal); 
%(c) Draw a line plot of points (xi; yi) for i = 1 ... 100 where xi is the
%i:th data point (in the sorted order) and yi is equal to i=100.
figure(3)
plot(r,(1:100)/100)

%(d) Can you tell what you have drawn?
%
%% Exercise 2. Generate a random matrix (dimensions for example 10 by 5) and store it into a file. Write a function that
%1. Takes a filename as an argument.
%2. Reads a data matrix X from the given file.
%3. Outputs row and column sums of X as bar plots. Try to put both plots into the same window.
%4. Returns two values: the dimensions of the matrix as a vector and the sum of all elements.
%Test your function by calling the function with the name of the file.

M = gallery('integerdata', 100, [5 8], 0); 
dlmwrite('data.txt', M, 'delimiter', '\t')
[dimensions,sum_of_matrix] = read_and_check('data.txt')

%% Exercise 3. The law of large numbers states that the average of a series of i.i.d. samples approaches the
%  expectation of the generating distribution as the number of samples goes to infinity. More formally, if all xn
%  are i.i.d. sampled from some random variable X we have
%  with probability 1. Let's verify this theorem empirically.

%(a) Generate samples from a normal distribution with mean 0 and variance 1.

size = 10000
mu = 0; 
sigma = 1; 
b = mu + sigma.*randn(1,size);
%(b) Plot N vs. the empirical mean in logarithmic scale.
b_cumsum = cumsum(b)
figure(5)
subplot(1,2,1)
size_array = 1:size
plot(size_array,b_cumsum./size_array)
subplot(1,2,2)
loglog(1:size,b_cumsum)
%(c) How fast does the empirical mean approach the expectation?
'
%% Exercise 4. The expectation of a random variable is a linear operator:   
% Let Fn be a random variable describing the number of fixed points (elements that don't change place) in a
% random permutation of n elements.
% (a) Write a function that takes n as an argument and returns a sample of lenght k from the distribution of

% (b) Generate samples from Fn with a few dierent values of n.
% (c) Draw histograms of the dierent samples.
% (d) Can you guess what the expected value E(Fn) of the distribution might be?
% (e) Use the linearity of the expectation operator to calculate E(Fn). (Hint: Take another random variable Fn


