% �����ֻ���Ϊ��Ϊ�׶��ĵ�λ��ʾ
%   num         ʵ������
%   unit_lst    ��λ�б�, ���� ['Hz', 'kHz', 'MHz', 'GHz']
%       ���²����ṩ���õĵ�λ�б�
%       0       ['', 'k', 'M', 'G']
%       1       ['Hz', 'kHz', 'MHz', 'GHz']
%   rate        �� num ���ڴ�ֵʱ, �ᱻ���л���, ���� 1024 �ᱻ����Ϊ 1.024 k
%   ext_text    �����ı�, ��ӵ����
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