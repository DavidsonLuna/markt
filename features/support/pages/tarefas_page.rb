

class AdicionarPage < SitePrism::Section
  element :alerta, '.alert-warn'
  element :campo_titulo, 'input[name=title]'
  element :campo_data, 'input[name=dueDate]'
  element :campo_tags, '.bootstrap-tagsinput input'
  element :botao_salvar, '#form-submit-button'

  def nova(tarefa, tags)
    campo_titulo.set tarefa['titulo']
    campo_data.set tarefa['data']

    tags.each do |t|
      campo_tags.set t['tag']
      campo_tags.send_keys :tab
    end

    botao_salvar.click
  end
end

class TarefasPage < SitePrism::Page
  section :adicionar, AdicionarPage, '#add-task-view'

  element :confirma_modal, 'button[data-bb-handler=success]'
  element :cancela_modal, 'button[data-bb-handler=danger]'

  element :titulo, '.header-title h3'
  element :botao_adicionar, '#insert-button'
  element :campo_busca, 'input[name=search]'
  element :botao_busca, '#search-button'

  elements :itens, 'table tbody tr'

  def buscar(titulo)
    campo_busca.set titulo
    botao_busca.click
  end

  def remover_primera_da_lista
    itens.first.find('#delete-button').click
  end

  def remover_por_titulo(titulo)
    itens.each do |linha|
      if linha.text.include?(titulo)
        linha.find('#delete-button').click
      end
    end
  end


end
