clc;
clear all;

Fs=2e9;  																%����Ƶ�� = 2G
N=2e6;    																%�������� = 1k
n=0:N-1;t=n/Fs;  														%ʱ�����У��𶯣�

% Ƶ���б�, ��λΪ MHz
freq_lst = -500:10:500;
cnt = length(freq_lst);

for j=1:1:cnt         % ���б�����
    if freq_lst(j) > 0
        a = 1;
    else
        a = 0;
    end
    gen_wave( ...
        a, ...
        Fs, ...
        abs(freq_lst(j)) * 1e6, ...
        N, ...
        16384);
end
