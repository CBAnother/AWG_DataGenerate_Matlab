% 生成数据
%   fs          采样速率, 单位为 Hz
%   freq        生成频率, 单位为 Hz
%   pts         生成的 IQ对 的点数, 单位为个, -1 表示刚好满一个周期（如果 fs / freq 不为整数, 则向上取整)
%   幅度最大值   例如 32768
%   占空比       范围 [0, 100]   
function gen_wave(fs, freq, pts, amp_max, duty)
    if pts == -1
        pts = ceil(fs / freq);
    end
    
    n = 0 : pts-1; t = n/fs;  
    
    wf = freq * 2 * pi;
    data = square(wf * t, duty) + 1i * square(wf * t, duty); 
   
    IQData(1:2:2*pts) = real(data) .* amp_max;
    IQData(2:2:2*pts) = imag(data) .* amp_max;
    for i = 1 : length(IQData)
       if IQData(i) == amp_max
            IQData(i) = amp_max - 1;
       end
    end
   
    file_name = sprintf([''...
        , 'squa_' ...
        , unit_text(fs, 0, 1000, 'fs_') ...
        , unit_text(freq, 1, 1000, '_') ...
        , unit_text(pts, 0, 1000, 'pts.bin') ...
        ]);
    write_file(file_name, IQData, 'int16');
end