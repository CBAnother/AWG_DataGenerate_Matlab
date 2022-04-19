clc;
clear all;

Fs=2e9;  																%采样频率 = 2G
N=2e6;    																%采样点数 = 1k
n=0:N-1;t=n/Fs;  														%时间序列（勿动）

% 频率列表, 单位为 MHz
freq_lst = -500:10:500;
cnt = length(freq_lst);

for j=1:1:cnt         % 按列表生成
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
