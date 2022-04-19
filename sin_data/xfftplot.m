function xfftplot(fs, file_path, start, points)
    fp = fopen(file_path, 'rb+');
    data = int16(fread(fp, 'int16'));
    fclose(fp);

    len = length(data) / 2;
    if points > len
        points = len;
    end
    
    x_axis = int32(start:(points * 2));
    data = double(data);
    %data = data / abs(max(data));
    
    N = points;%采样点数
    a = data(x_axis);
    PH2=(fft(a)); %a为时域信，作fft变换

    %下面为幅值修正
    P2 = (PH2/N);
    P1 = P2(1:N/2+1);%此时选取前半部分，因为fft之后为对称的双边谱
    P1(2:end-1) = 2*P1(2:end-1);

    %画图
    f = fs*(0:(N/2))/N;
    plot(f,abs(P1))
    title('时域信号')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
end