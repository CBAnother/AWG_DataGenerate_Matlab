% file_path         IQ bin 文件路径, 内容格式为 [I Q I Q ...], 其中 I 16bit, Q 16bit
% start             起点, 第 start 个点
% points            播放的点的数量
function xplot(file_path, start, points)
    fp = fopen(file_path, 'rb+');
    data = int16(fread(fp, 'int16'));
    fclose(fp);

    len = length(data) / 2;
    if points > len
        points = len;
    end
    
    x_axis = start:points;
    sin_data = data(1:2:end);
    cos_data = data(2:2:end);
    
    ax1 = subplot(2,1,1);
    ax2 = subplot(2,1,2);
    
    plot(ax1,x_axis,sin_data(x_axis));
    title(ax1,'Sin');

    plot(ax2,x_axis,cos_data(x_axis));
    title(ax2,'Cos')
    
    % plot(x_axis, sin_data(start:points), x_axis, cos_data(start:points));
end