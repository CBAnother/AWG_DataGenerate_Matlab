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
    
    N = points;%��������
    a = data(x_axis);
    PH2=(fft(a)); %aΪʱ���ţ���fft�任

    %����Ϊ��ֵ����
    P2 = (PH2/N);
    P1 = P2(1:N/2+1);%��ʱѡȡǰ�벿�֣���Ϊfft֮��Ϊ�ԳƵ�˫����
    P1(2:end-1) = 2*P1(2:end-1);

    %��ͼ
    f = fs*(0:(N/2))/N;
    plot(f,abs(P1))
    title('ʱ���ź�')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
end