
% cat pagerank.m
#!/usr/bin/octave
## pagerank.m - PageRank(TM) �v�Z�p�̊ȒP�� GNU Octave �X�N���v�g

## �^�C�}�[���Z�b�g�B
tic();

## ���� i ���當�� j �ւ̃����N�̏�Ԃ��������ڊm���s�� M(i,j) ��
## PageRank �̒�`�ɏ]���Ē�`�B

M=csvread('matrix.csv')

## M �̌ŗL�l�ƌŗL�x�N�g����̑g���킹�̂��ׂĂ��v�Z�B
[V,D] = eig(M)

## ��Βl���ő�̌ŗL�l�ɑΉ�����ŗL�x�N�g���� EigenVector �ɕۑ��B
EigenVector = V(:, find(max(abs(diag(D)))))

## PageRank �� EigenVector ���m���x�N�g���ɐ��K���������́B
PageRank = EigenVector ./ norm(EigenVector, 1)

## ���������v�Z���Ԃ�\���B
elapsed_time = toc()

csvwrite('pagerank.csv', PageRank)

