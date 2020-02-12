data = dlmread('data.txt');
expected = dlmread('expected.txt');

    idx = kmeans(data, 3);
    TP = 0; TN = 0; FP = 0; FN = 0;
    
    for i=1 : length(idx) - 1
        for j = i + 1 : length(idx)
            if idx(i) == idx(j) %positive sample by k means. Is it truly positive or no? check on the other
                if(expected(i) == expected(j))
                    TP = TP + 1;
                else    
                    FP = FP + 1;
                end
            elseif expected(i) ~= expected(i)
                    TN = TN + 1;
            else 
                FN = FN + 1;
            end
        end
    end
    
    R1 = (TP + TN)/(TP + TN + FP + FN);