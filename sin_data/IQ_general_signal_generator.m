%{
a=imread('a.bmp');														%导入图片 
[picm,picn]=size(a);													%获取图片行m和列n
pic_div = 5;															%对图像进行抽取，
picm_div = round(picm/pic_div);											%获取抽取后的图像横纵分辨率
picn_div = round(picn/pic_div);
b=zeros(picm_div,picn_div);
for line=1:1:picm_div-1
    for row=1:1:picn_div-1
       b(line,row)=a(line*pic_div,row*pic_div);
    end
end

imshow(b);																%展示抽取后的图像
%}
clc;
clear all;

Fs=2e9;  																%采样频率 = 2G
N=2e6;    																%采样点数 = 1k
n=0:N-1;t=n/Fs;  														%时间序列（勿动）

% 频率列表, 单位为 MHz
freq_lst = [1, 10, 50, 100, 150, 200, 250, 300, 350, 400, 450, 460, 470, 480, 490, 500, 510, 520, 530, 540, 550, 600, 650, 700, 750, 800];
cnt = length(freq_lst);
MultiTone = zeros(cnt, N,'double');
fftResult = zeros(cnt, N,'double');

for j=1:1:length(freq_lst)         % 按列表生成
    freq = freq_lst(j) * 1e6;
    
    wf = freq * 2* pi;
    MultiTone(j,:) = MultiTone(j,:) + cos(wf*t)+1i*sin(wf*t);		% 生成频谱信号
    
    MultiTone(j,:) = MultiTone(j,:) / max(abs(MultiTone(j,:))); 
    compMultiToneReal = real(MultiTone(j,:)) .* 16384;
    compMultiToneImag = imag(MultiTone(j,:)) .* 16384;
     
    IQData(1:2:2*N) = compMultiToneReal;
    IQData(2:2:2*N)   = compMultiToneImag;
    
    targetFilePath = sprintf([int2str(freq / 1e6), 'M_', int2str(N), '.bin'],j);
    targetFileHandle = fopen(targetFilePath,'wb+');
    
    fwrite(targetFileHandle,IQData,'int16');
    
    fclose(targetFileHandle);
end
