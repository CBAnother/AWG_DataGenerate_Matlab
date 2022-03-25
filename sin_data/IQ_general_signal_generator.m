clc;
clear all;

Fs=2e9;  																%采样频率 = 2G
N=2e6;    																%采样点数 = 1k
n=0:N-1;t=n/Fs;  														%时间序列（勿动）

% 频率列表, 单位为 MHz
freq_lst = [10, 100, 200, 300, 400, 500];
cnt = length(freq_lst);

for j=1:1:cnt         % 按列表生成
    gen_wave( ...
        1, ...
        Fs, ...
        freq_lst(j) * 1e6, ...
        N, ...
        16384);
end
