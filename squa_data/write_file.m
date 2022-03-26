function write_file(file_name, data, data_fmt)
    fp = fopen(file_name, 'wb+');
    fwrite(fp, data, data_fmt);
    fclose(fp);
end