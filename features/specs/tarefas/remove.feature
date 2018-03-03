#language: pt

Funcionalidade: Remover tarefas
    Para que eu possa organizar minhas atividades
    Sendo um usuário que cadastrou uma tarefa indesejada
    Posso solcitar a exclusão de uma tarefa
    
    Contexto: Solicita exclusão
        Dado que eu tenho uma tarefa cadastrada
        Quando eu solicito a exclusão desta tarefa

    @auth @remover @logout
    Cenario: Remover uma tarefa indesejada

        E confirmo a solicitação
        Então esta tarefa não deve ser exibida na lista

    @auth @desistir @logout
    Cenario: Desistir da remoção

        Mas eu cancelo a solicitação
        Então esta tarefa permanece cadastrada na lista





