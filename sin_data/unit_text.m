% 将数字换算为较为易读的单位显示
%   num         实际数字
%   unit_lst    单位列表, 例如 ['Hz', 'kHz', 'MHz', 'GHz']
%       以下参数提供常用的单位列表
%       0       ['', 'k', 'M', 'G']
%       1       ['Hz', 'kHz', 'MHz', 'GHz']
%   rate        当 num 大于此值时, 会被进行换算, 例如 1024 会被换算为 1.024 k
%   ext_text    额外文本, 添加到最后
function text = unit_text(num, unit_lst, rate, ext_text)
    if unit_lst == 0
        unit_lst =  char('', 'k', 'M', 'G');
    elseif unit_lst == 1
        unit_lst =  char('Hz', 'kHz', 'MHz', 'GHz');
    end
    
    len = length(unit_lst);
    idx = 1;
    while(num >= rate)
        num = num / rate;
        idx = idx + 1;
    end
    
    if idx > len 
        text = 'out of range';
        return
    end
            
    text = sprintf([num2str(num), strip(unit_lst(idx, :)), ext_text]);
end