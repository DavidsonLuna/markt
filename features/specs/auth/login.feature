#language: pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tarefas
    Sendo um usuário
    Posso logar no sistema com meus dados de acesso previamente cadastrados

    @login @logout @smoke
    Cenário: Login do usuário

        Quando faço login com "eu@papito.io" e "123456"
        Então sou autenticado com sucesso
        E vejo as minhas tarefas

    @login_exp
    Esquema do Cenário: Tentativa de login

        Quando faço login com "<email>" e "<senha>"
        Então não sou autenticado
        E devo ver a mensagem "<alerta>"

        Exemplos:
            | email                      | senha  | alerta                      |
            | eu@papito.io               | abc123 | Senha inválida.             |
            | padre.kevedo@noekziste.com | 123456 | Usuário não cadastrado.     |
            | eu@papito.io               |        | Senha ausente.              |
            |                            | abc123 | Email incorreto ou ausente. |

