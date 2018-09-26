
% cat pagerank.m
#!/usr/bin/octave
## pagerank.m - PageRank(TM) 計算用の簡単な GNU Octave スクリプト

## タイマーをセット。
tic();

## 文書 i から文書 j へのリンクの状態を示す推移確率行列 M(i,j) を
## PageRank の定義に従って定義。

M=csvread('matrix.csv')

## M の固有値と固有ベクトル列の組合わせのすべてを計算。
[V,D] = eig(M)

## 絶対値が最大の固有値に対応する固有ベクトルを EigenVector に保存。
EigenVector = V(:, find(max(abs(diag(D)))))

## PageRank は EigenVector を確率ベクトルに正規化したもの。
PageRank = EigenVector ./ norm(EigenVector, 1)

## かかった計算時間を表示。
elapsed_time = toc()

csvwrite('pagerank.csv', PageRank)

