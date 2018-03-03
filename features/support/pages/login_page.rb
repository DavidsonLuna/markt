

class LoginPage < SitePrism::Page

  set_url 'https://marktasks.herokuapp.com'
  element :input_email, '#login_email'
  element :input_password, '#login_password'
  element :botao_logar, 'button[id*=btLogin]'
  element :alerta, '.alert-login'

  def logar(email, senha)
    input_email.set email
    input_password.set senha
    botao_logar.click
  end


end
