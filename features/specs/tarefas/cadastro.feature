#language: pt

Funcionalidade: Cadastrar tarefas
    Para que eu possa organizar minha atividades
    Sendo um usuário cadastrado
    Posso cadastrar novas tarefas

    @auth @nova_tarefa @logout @smoke
    Cenario: Nova tarefa

        Dado que eu tenho uma tarefa com os atributos:
            | titulo | Ler um livro de Ruby |
            | data   | 31/03/2018           |
        E eu quero taguear esta tarefa com:
            | tag     |
            | ruby    |
            | livro   |
            | leitura |
            | estudar |
        Quando eu faço o cadastro desta tarefa
        Então devo ver esta tarefa com o status "Em andamento"

    @auth @tarefa_dup @logout
    Cenario: Tarefa com o mesmo título

        Dado que eu tenho uma tarefa com os atributos:
            | titulo | Ler um livro de Go lang |
            | data   | 01/04/2018              |
        E eu quero taguear esta tarefa com:
            | tag      |
            | go       |
            | livro    |
            | leitura  |
            | hardcore |
        Mas eu já cadastrei esta tarefa e não tinha percebido
        Quando eu faço o cadastro desta tarefa
        Então eu devo ver a mensagem "Tarefa duplicada." ao tentar fazer o cadastro
    