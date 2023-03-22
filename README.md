
### Backend

1. Processo de criação de classes e atributos.
- [x] Classe Municipe 
	- [x] nome completo (obrigatório)
	- [x] cpf (obrigatório e com validação)
	- [x] cns (obrigatório e com validação)
	- [x] email (obrigatório e com validação)
	- [x] data de nascimento (obrigatório e com validação de realidade)
	- [x] telefone (obrigatório)
	- [x] foto (obrigatório)
	- [x] status (obrigatório)
- [x] Classe Endereço 
	- [x] CEP (obrigatório)
	- [x] logradouro (obrigatório)
	- [x] complemento 
	- [x] bairro (obrigatório)
	- [x] cidade (obrigatório)
	- [x] UF (obrigatório)
	- [x] IBGE
- [x] Relacionamento entre Municipe <-> Endereço
- [x] Adicionar a validação de presença direto na classe e não no banco de dados, para que seja facilitado as alterações quanto a obrigatoriedade dos campos.


2. Processo de criação do CRUD.

- [x] Criação do CRUD que envolve o Municipe.
- [x] Criação do CRUD que envolve o Endereço.

3. Processo de criação das regras de negócio.

- [x] Após criar/atualizar um munícipe, enviar um email e sms informando sobre a operação.
- [x] No cadastro de endereço permitir a busca do endereço através do CEP para melhorar a experiência e otimizar o tempo do usuario.
- [x] Filtro de Municipes por dados do mesmo e/ou de endereço.

4. Processo de criação de testes.

 - [x] Realizar a criação de testes que envolvem as regras de negócios.

5. Processo de deploy

- [ ] Subir o gerenciamento para produção, tornando o acesso público.
- [x] Código completo versionado no GitHub.


### Frontend

1. Processo de criação das interfaces/views.

- [x] Landing page simples que possibilita o login do usuario no sistema.
- [x] Tela com uma tabela exibindo os municipes já cadastrados.
- [x] Tela de cadastro de municipe e endereço contendo uma barra de progresso que diz respeito ao andamento do cadastro atual.
