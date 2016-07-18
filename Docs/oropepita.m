function tabla = oropepita

    tabla = ones (64,3);
    base = [231,174,24]/255;
    for a=1:64
        tabla(a,:) = base*a/64;
    end
end