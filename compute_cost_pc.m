function [cost] = compute_cost_pc(points, centroids)
  [np dp] = size (points);
  [nc dc] = size (centroids);
  
  cost = 0;
  for i = 1:np
    min = 100;
    for j = 1:nc
      dist = norm (points(i,:) - centroids(j,:));
       if dist < min
        min = dist; # distanta minima de la fiecare point -> centroid
      endif
    endfor
    cost += min; # costul final
  endfor
endfunction

