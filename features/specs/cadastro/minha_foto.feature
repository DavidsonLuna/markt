#language: pt

Funcionalidade: Minha foto
    Para que meu perfil fique muito bonito
    Sendo um usuário cadastrado
    POsso fazer upload da minha foto

    @auth @foto @logout
    Cenário: Carregar minha foto

        Dado que eu tenho uma foto muito bonita
        E eu acesso o meu perfil
        Quando faço o upload da minha foto
        Então devo ver a seguinte mensagem de upload de foto: "Agora seu perfil está bem legal."