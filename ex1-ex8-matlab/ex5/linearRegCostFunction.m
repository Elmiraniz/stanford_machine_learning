function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

J = (sum((X * theta - y) .^ 2) + lambda * sum(theta(2:end) .^ 2) ) / 2 / m;

grad(1) = sum((X * theta - y) .* X(:, 1)) / m;
% to vectorize the summation in grad computation, sum(X*theta - y) .*
% X(:,j) we do the following to get grad for j > 1: (Pxm) * (mx1) + (px1)
grad(2:end) = (X(:, 2:end)' * (X * theta - y) + lambda * theta(2:end)) / m;

% =========================================================================

grad = grad(:);

end
