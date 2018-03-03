#language: pt

Funcionalidade: Meu perfil
    Para que eu possa manter meus dados atualizados
    Sendo um usuário
    Posso completar o cadastro do meu perfil

    @meu_perfil @logout
    Esquema do Cenario: Atualizar meu perfil

        Dado que eu estou autenticado com "eu@papito.io" e "123456"
        E eu acesso o meu perfil
        Quando completo o meu cadastro com "<empresa>" e "<cargo>"
        Então devo ver a mensagem "Perfil atualizado com sucesso." de atualização cadastral

        Exemplos:
            | empresa   | cargo      |
            | Google    | Developer  |
            | Microsoft | CTO        |
            | Facebook  | Estagiário |
            | Amazon    | CEO        |
            | QA Ninja  | QA         |
