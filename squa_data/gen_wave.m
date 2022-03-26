% ��������
%   fs          ��������, ��λΪ Hz
%   freq        ����Ƶ��, ��λΪ Hz
%   pts         ���ɵ� IQ�� �ĵ���, ��λΪ��, -1 ��ʾ�պ���һ�����ڣ���� fs / freq ��Ϊ����, ������ȡ��)
%   �������ֵ   ���� 32768
%   ռ�ձ�       ��Χ [0, 100]   
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