clear;
% HWK 2 problem 1

nums = {};

for i = 10:99
    for j = 10:99
        if i < j
            i_first_digit = floor(i / 10);
            i_second_digit = mod(i, 10);
            j_first_digit = floor(j / 10);
            j_second_digit = mod(j, 10);
            if (i_second_digit== j_first_digit)
                if (i/j == (i_first_digit / j_second_digit))
                    nums{end+1} = i;
                    nums{end+1} = j;
                end
            end
        end
    end
end