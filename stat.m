load iris.txt;
A = randn(10000, size(iris, 2));
topI = 0;
topIndex = 0;
for i = 1:size(A, 1)
    X = zeros(size(iris, 1), 1);
    for j = 1:size(A, 2)
        X = X + A(i, j) * iris(:, j);
    end
    [I] = informativity(X);
    if I > topI
        topI = I;
        topIndex = i;        
    end
end
X = A(topIndex,:);
one = zeros(50, 1);
two = zeros(50, 1);
three = zeros(50, 1);
for i = 1:150
    X1 = i;
    X2 = iris(i,:) * X';
    if i < 51
        plot (X1, X2, 'og');
        one(i) = X2;
    elseif i < 101
        plot (X1, X2, 'ob');
        two(i - 50) = X2;
    else
        plot (X1, X2, 'or');
        three(i - 100) = X2;
    end
    hold on;
    grid on;
end
[K1] = rule(one, two);
plot([0 150], [K1 K1]);
hold on;
[K2] = rule(two, three);
plot([0 150], [K2 K2]);
hold on;



