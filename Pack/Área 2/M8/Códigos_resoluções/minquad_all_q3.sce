clear;
x=1:0.5:12 // O X
x = x'
y = 3 * sin(x + 16) + x.^2// Y do problema

n=size(x,1);

M=[x^0 x.^1 x.^2] //x e x^2 polinomio (formato bx + cx^2), se quiser a+bx+cx^2 ficaria [x.^0 x x.^2]

cu = M' * M

pau = M' * y //SE VOCÊ CRIOU Y COM PONTOS SEPARADOS (SEM SER FUNÇÃO DE X), AQUI TEM QUE SER y'
            //alternativamente, só adiciona o ' (ou tira ele) se der inconsistent rows
            //isso aí, boa sorte nas provas :0


disp('Coeficientes:')
disp(inv(cu)*pau)
