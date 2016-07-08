function [area_vector, volume_vector] = Cone(r_vector, h_vector)
 
if length(r_vector) ~= length(h_vector)
    error('invalid inputs')
end

s_vector = sqrt(r_vector.^2 + h_vector.^2);

area_vector = (pi .* r_vector .* s_vector) + (pi * r_vector.^2);

volume_vector = h_vector .* (pi/3) .* r_vector.^2;
