%Q1: Variables, Operations, Arrays, Loops, and Functions
%a) Defining Variables and Performing Simple Operations
% Define variables

a = 5;
b = 3;

% Operations
multiplication = a * b
addition = a + b
division = a / b
subtraction = a - b

%b) Clearing the Workspace and Command Window
% Clear all variables

clear

% Clear command window

clc

%c) Defining Arrays and Performing the Transpose Operation
% Define arrays

c = [1, 2, 3];            % 1D array
d = [1, 2; 3, 4];         % 2D array

% Transpose of d

d_transpose = d'

%d) Matrix Multiplication
% Define matrices

A = [1, 2; 3, 4];
B = [5, 6; 7, 8];

% Element-wise multiplication

elementwise = A .* B

% Matrix multiplication

matrix_product = A * B

% Difference:
% '*' performs matrix multiplication.
% '.*' performs element-wise multiplication.

%e) Defining Custom Functions
% Single variable function

f = @(x) x.^2 + 3*x + 2;
f_val = f([1, 2, 3])

% Multi-variable function

g = @(x, y) x.^2 + y.^2;
g_val = g(1, 2)

%f) Adding Comments
% This is a comment in MATLAB
% Use '%' to explain each step of your code

%Q2: Pre-defined MATLAB Functions and Visualization
%a) Linear Spaces and Evaluating Functions

x = linspace(0, 2*pi, 100);
y_exp = exp(x);
y_sin = sin(x);

%b) Plotting Single Variable Functions

figure;
plot(x, sin(x), 'r--', 'DisplayName', 'sin(x)'); hold on;
plot(x, cos(x), 'b:', 'DisplayName', 'cos(x)');
legend;
xlabel('x'); ylabel('Function Value');
title('Plot of sin(x) and cos(x)');

%c) Using Meshgrid to Generate 2D Spaces

x = linspace(-2*pi, 2*pi, 100);
y = linspace(-2*pi, 2*pi, 100);
[X, Y] = meshgrid(x, y);
Z = sin(X + Y);

%d) Visualizing Multivariable Functions
% Surface plot

figure;
surf(X, Y, Z);
colorbar;
title('3D Surface Plot of sin(x + y)');

% Contour plot

figure;
contour(X, Y, Z, 20);
colorbar;
title('Contour Plot of sin(x + y)');

%Q3: Loops, Integration, and Vectorization
%a) Introduction to Loops

val = 0;
for i = 1:10
    val = val + 1;
end
val

%b) Numerical Integration using Riemann Sums

a = 0; b = 2*pi; n = 1000;
dx = (b - a) / n;
sum_riemann = 0;
for i = 0:n-1
    x = a + i * dx;
    sum_riemann = sum_riemann + sin(x) * dx;
end
sum_riemann

%c) Vectorized Riemann Sum with Linspace

a = 0; b = 2*pi; n = 1000;
dx = (b - a) / n;
x_mid = linspace(a + 0.5*dx, b - 0.5*dx, n);

% Timing vectorized version

tic;
y = sin(x_mid);
area = sum(y) * dx;
toc;
area

%d) Built-in Integration Function

integral_result = integral(@sin, 0, 2*pi);
integral_result


%Summary
%This assignment covers the basics of MATLAB, including variable 
%definition, operations, arrays, loops, custom functions, plotting, 
%and integration using both manual and built-in methods.