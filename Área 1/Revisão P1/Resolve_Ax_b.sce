function [resultado] = erro_relativo(x, xl)
    resultado = abs((x-xl)/x)
endfunction

function [resultado] = digitos_significativos(x, xl)
    erro_rel = erro_relativo(x,xl)
    resultado = 0
    while erro_rel <= 5*10^(resultado * (-1))
        resultado = resultado + 1
    end
    
    resultado = resultado - 1
endfunction

function [x] = solveU(U,b)
    n = size(U,1)
    x(n) = b(n)/U(n,n)
    for i = n-1:-1:1
        x(i) = (b(i)-U(i,i+1:n)*x(i+1:n))/U(i,i)
    end
endfunction

function [x] = solveL(L,b)
    n = size(L,1)
    x(1) = b(1)/L(1,1)
    for i=2:n
        x(i)=(b(i)-L(i,1:i-1)*x(1:i-1))/L(i,i)
    end
endfunction

function [L,A] = fatoraLU(A)
    n = size(A,1)
    L = eye(n,n)
    for j = 1:n-1
        for i = j+1:n
            L(i,j) = A(i,j)/A(j,j)
            A(i,j+1:n) = A(i,j+1:n) - L(i,j)*A(j,j+1:n)
            A(i,j) = 0 //Força para evitar erros de arredondamento
        end
    end
endfunction

function [x] = resolve(A,b)
    [L,U] = fatoraLU(A)
    y = solveL(L,b)
    x = solveU(U,y)
endfunction

A = [1.000001 2 3;4 5 6;7 8 9]
x = [1;2;3]
b = A*x
xstar = resolve(A,b) //Aproximação da resolução
.
vetor_erro = (x - xstar)
erro_relativo = norm(x - star)/norm(x)

