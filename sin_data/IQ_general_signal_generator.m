clc;
clear all;

Fs=2e9;  																%����Ƶ�� = 2G
N=2e6;    																%�������� = 1k
n=0:N-1;t=n/Fs;  														%ʱ�����У��𶯣�

% Ƶ���б�, ��λΪ MHz
freq_lst = [10, 100, 200, 300, 400, 500];
cnt = length(freq_lst);

for j=1:1:cnt         % ���б�����
    gen_wave( ...
        1, ...
        Fs, ...
        freq_lst(j) * 1e6, ...
        N, ...
        16384);
end
