Dado('que eu tenho uma tarefa com os atributos:') do |table|
  @nova_tarefa = table.rows_hash
  # @nova_tarefa['titulo'] = "#{@nova_tarefa['titulo']} - #{Faker::Lorem.characters(10)}"
  @helpers.remover_tarefa(@token, @nova_tarefa['titulo'])
end

Dado('eu quero taguear esta tarefa com:') do |table|
  @tags = table.hashes
end

Dado('eu já cadastrei esta tarefa e não tinha percebido') do
  @tarefas.botao_adicionar.click
  @tarefas.adicionar.nova(@nova_tarefa, @tags)
end

Quando('eu faço o cadastro desta tarefa') do
  @tarefas.botao_adicionar.click
  @tarefas.adicionar.nova(@nova_tarefa, @tags)
end

Então('devo ver esta tarefa com o status {string}') do |status_tarefa|
  @tarefas.wait_for_itens
  expect(@tarefas.itens.first).to have_content status_tarefa

  @tarefas.buscar(@nova_tarefa['titulo'])
  expect(@tarefas.itens.size).to eql 1
end

Então('eu devo ver a mensagem {string} ao tentar fazer o cadastro') do |mensagem|
  expect(@tarefas.adicionar.alerta).to have_content mensagem
end

# Remover

Dado('que eu tenho uma tarefa cadastrada') do
  @tarefa_para_apagar = {
    'titulo' => 'Tarefa muito boa para ser apagada ' + Faker::Lorem.characters(10),
    'data' => '31/12/2018'
  }
  @tags = []
  @tarefas.botao_adicionar.click
  @tarefas.adicionar.nova(@tarefa_para_apagar, @tags)
end

Quando('eu solicito a exclusão desta tarefa') do
  @tarefas.wait_for_itens
  @tarefas.remover_por_titulo(@tarefa_para_apagar['titulo'])
end

Quando('confirmo a solicitação') do
  @tarefas.confirma_modal.click
end

Quando('eu cancelo a solicitação') do
  @tarefas.cancela_modal.click
end

Então('esta tarefa não deve ser exibida na lista') do
  @tarefas.wait_for_itens
  expect(@tarefas.itens).not_to have_content @tarefa_para_apagar['titulo']
end

Então('esta tarefa permanece cadastrada na lista') do
  @tarefas.wait_for_itens
  expect(@tarefas.itens.first).to have_content @tarefa_para_apagar['titulo']
end
