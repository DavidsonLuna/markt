Quando('faço login com {string} e {string}') do |email, senha|
  @login.load
  @login.logar(email, senha)

  @email = email
end

Então('sou autenticado com sucesso') do
  expect(@nav.menu_usuario.text).to eql @email
end

Então('vejo as minhas tarefas') do
  expect(@tarefas.titulo.text).to eql 'Painel de Atividades'
end

Então('não sou autenticado') do
  expect(@tarefas.has_no_itens?).to be true
end

Então('devo ver a mensagem {string}') do |mensagem|
  expect(@login.alerta).to have_content mensagem
end
