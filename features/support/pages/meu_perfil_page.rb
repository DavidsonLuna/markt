

class PerfilPage < SitePrism::Page
  element :formulario, 'form'
  element :input_empresa, 'input[name$=company]'
  element :combo_cargo, 'select[name$=job]'
  element :botao_salvar, 'button[type=submit]'

  def atualiza(empresa, cargo)
    input_empresa.set empresa
    combo_cargo.find('option', text: cargo).select_option
    botao_salvar.click
  end

  def upload(foto)
    # page.execute_script("$('input[type=file]').attr('id', 'id-do-gato');")
    attach_file('profile-avatar', foto)
  end

end
