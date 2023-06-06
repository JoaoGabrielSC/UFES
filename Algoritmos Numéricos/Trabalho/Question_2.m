fprintf ('\n\nSolução da Questão 2 : Converta a soluç˜ao em uma função n˜ao-simbólica.\n\n');


[~, ~, ~, yx, yxstr] = solveEDO('y*log(x+1)', 0, 1) 

[~, ~, ~, yx, yxstr] = solveEDO('y*(x**2 -1)', 0, 1) 

[~, ~, ~, yx, yxstr] = solveEDO('1-(y/x)', 0, 1) 
