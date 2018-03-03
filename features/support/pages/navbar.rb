
class Navbar < SitePrism::Page
  element :menu_usuario, 'a[href*=dropdown]'
  element :meu_perfil, '#navbar a[href="/user_settings"]'
  element :link_sair, 'a[href$=logout]'

  def bye_bye
    menu_usuario.click
    link_sair.click
  end
end
