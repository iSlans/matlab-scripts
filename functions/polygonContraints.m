% points = [
%     2 0
%     5 3
%     1 5
%     -1 1
%     ];

function polygonContraints (points)

    arguments
        points (:, 2)
    end

    middle = mean(points);
    middle = middle(:);

    % RicOp.vert2con(points)
    % return

    order = convhull(points);
    vertices = points(order, :);

    syms x y

    eqs = [];

    for i = 1:length(vertices) - 1
        p1 = vertices(i, :);
        p2 = vertices(i + 1, :);

        if p1(1) == p2(1)

            if middle(1) < p1(1)
                eqs = [eqs; x <= p1(1)];
            else
                eqs = [eqs; x >= p1(1)];
            end

            continue
        end

        coeff = [p1(1) 1; p2(1) 1] \ [p1(2); p2(2)];

        a = coeff(1);
        b = coeff(2);
        mid_x = middle(1);
        mid_y = middle(2);

        % -ax + y <= b

        if -a * mid_x + mid_y <= b
            [~, den] = numden(- a * x + y -b);
            assert(den > 0)
            eq =- a * x + y -b <= 0;
            eq = eq * den;
        else
            [~, den] = numden(a * x - y +b);
            assert(den > 0)
            eq = a * x - y +b <= 0;
            eq = eq * den;
        end

        eqs = [eqs; simplify(eq)];
    end

    eqs
end
