function [centroids] = clustering_pc(points, NC)
  [N D] = size (points);
  centroids = zeros (NC,D);
  first_ctd= zeros (1,D);
  cluster = zeros (1,D);
  
  for i = 1:NC
    x = 0;
    l = 1;
    index = i + NC * x;
      while index <= N
        cluster(l, 1:D) = points(index, 1:D); # construim fiecare cluster
        l++;
        x++;
        index = i + NC * x;
      endwhile
      [nrl nrc] = size (cluster);
      for j = 1:D
        sum = 0;
        ma = 0;
        for j1= 1:nrl
        sum += cluster(j1,j);
        endfor
        ma = sum / nrl;
        first_ctd(1,j) = ma; # construim fiecare centroid
      endfor
    first_mat(i, 1:D) = first_ctd(1, 1:D); # prima matrice de centroizi
  endfor
  
  # algoritmul continua pana cand centroizii rezultati vor fi egali cu cei initiali
  
 old_first_mat= zeros (NC,D);
do
 for p = 1:NC
   new_cluster = zeros (1, 1:D);
   l1 = 1;
  for k = 1:N
    idx = 0;
    min = 100;
    pct = 0;
    for q = 1:NC
      dist = norm (points(k,:) - first_mat(q,:));
      if dist < min
        min = dist;
        idx = q;
        pct = k;
      endif
    endfor
    if idx == p
    new_cluster(l1,1:D) = points(pct,:);
    l1++;
    endif
  endfor
  [nrl1 nrc1] = size (new_cluster);
    for j2 = 1:D
      new_sum = 0;
      new_ma = 0;
      for j3 = 1:nrl1
      new_sum += new_cluster(j3,j2);
      endfor
      new_ma = new_sum / nrl1;
      ctd(1,j2) = new_ma; # centriod nou
    endfor
    centroids(p, 1:D) = ctd(1, 1:D); # centroizi rezultati dupa fiecare iteratie
 endfor

  old_first_mat(:,:) = first_mat(:,:);
  first_mat(:,:) = centroids;

until first_mat(:,:) == old_first_mat(:,:)

endfunction
