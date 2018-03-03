

Before do
  @login = LoginPage.new
  @tarefas = TarefasPage.new
  @perfil = PerfilPage.new
  @nav = Navbar.new

  @helpers = Helpers.new

  page.current_window.resize_to(1280, 800)
end

Before('@auth') do
  @email = 'eu@papito.io'
  @senha = '123456'
  @login.load
  @login.logar(@email, @senha)
  @token = @helpers.login(@email, @senha)
end

After('@logout') do
  @nav.bye_bye
end

After do |scenario|
  # if scenario.failed?
  nome_cenario = scenario.name.tr(' ', '_').downcase!
  nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
  screenshot = "logs/shots/#{nome_cenario}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Clique aqui para ver a evidência!')
  # end
end
