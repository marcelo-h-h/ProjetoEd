lista = []
lista.append(25)
lista.append(46)
lista.append(18)
lista.append(38)

print('A lista inicia em:', lista) #por exemplo

proximo = int(input('Proximo a entrar na fila: '))
while (proximo != 0):
    if (proximo < 60):
        lista.append(proximo)
    else:
        ultimo = 0
        for pessoa in lista:
            if(pessoa > proximo):
                ultimo = lista.index(pessoa) + 1
        lista.insert(ultimo, proximo)
    print('lista agora: ', lista)
    proximo = int(input('Proximo a entrar na fila: '))