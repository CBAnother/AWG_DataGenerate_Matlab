% 生成数据
%   fs          1 为正频, 0 为负频
%   sample      采样速率, 单位为 Hz
%   freq        生成频率, 单位为 Hz
%   pts         生成的 IQ对 的点数, 单位为个
%   幅度最大值   例如 32768
function gen_wave(postive, fs, freq, pts, amp_max)
    n = 0 : pts-1; t = n/fs;  
    
    wf = freq * 2 * pi;
    symbol = '+';
    
    if postive == 0
        data = cos(wf * t) + 1i * sin(wf * t);
        symbol = '-';
    else
        data = sin(wf * t) + 1i * cos(wf * t); 
    end
    
    IQData(1:2:2*pts) = real(data) .* amp_max;
    IQData(2:2:2*pts) = imag(data) .* amp_max;
    for i = 1 : length(IQData)
       if IQData(i) == amp_max
            IQData(i) = amp_max - 1;
       end
    end
   
    file_name = sprintf([''...
        , unit_text(fs, 0, 1000, 'fs_') ...
        , symbol ...
        , unit_text(freq, 1, 1000, '_') ...
        , unit_text(pts, 0, 1000, 'pts.bin') ...
        ]);
    write_file(file_name, IQData, 'int16');
end