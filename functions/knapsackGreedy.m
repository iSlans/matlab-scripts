function [solution, val] = knapsackGreedy(value, weight, capacity)
    % Knapsack problem greedy algorithm evaluation by value/weight ratio

    arguments
        value (:, 1)
        weight (:, 1)
        capacity (1, 1)
    end

    assert(length(value) == length(weight))

    efficiencyRatio = value ./ weight;
    solution = zeros(size(value));
    sumweight = 0;

    while sumweight < capacity

        [maxvalue, idx] = max(efficiencyRatio);

        if maxvalue == 0 || sumweight + weight(idx) > capacity
            break
        end

        solution(idx) = 1;
        efficiencyRatio(idx) = 0;
        sumweight = sumweight + weight(idx);
    end

    val = dot(solution, value);

end
