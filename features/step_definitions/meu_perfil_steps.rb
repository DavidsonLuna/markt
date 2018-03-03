Dado('que eu estou autenticado com {string} e {string}') do |email, senha|
  @login.load
  @login.logar(email, senha)
end

Dado('eu acesso o meu perfil') do
  @nav.menu_usuario.click
  @nav.meu_perfil.click
end

Quando('completo o meu cadastro com {string} e {string}') do |empresa, cargo|
  @perfil.atualiza(empresa, cargo)
end

Então('devo ver a mensagem {string} de atualização cadastral') do |mensagem|
  expect(@perfil.formulario).to have_content mensagem
end

# Upload

Dado('que eu tenho uma foto muito bonita') do
  # @minha_foto = File.join(Dir.pwd, 'features/support/fixtures/foto1.png')
  @minha_foto = File.join(Dir.pwd, 'features/support/fixtures/foto2.jpg')
end

Quando('faço o upload da minha foto') do
  @perfil.upload(@minha_foto)
end

Então('devo ver a seguinte mensagem de upload de foto: {string}') do |mensagem|
  expect(@perfil.formulario).to have_content mensagem
  sleep 5
end
