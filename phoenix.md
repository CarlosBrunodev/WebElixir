# Programação funcional av3

Equipe : Carlos Bruno 
		Pablo Fernandes 

## Criação de aplicação web utilizando exilir e phoenix

Requisitos :
* mix 
* Postgres
* npm
* node


>Primeiro passo é executar o mix phx pra que ele crie a estrutura inicial do projeto :

	$ mix phx.new {nomedoseuprojeto}


>Logo apos rodamos o migrate pra que ele crie o esquema com o banco de dados e suas conexões :

	$ mix ecto.create


>Para verificar se tudo aconteceu da maneira correta executamos o servidor , que por default utiliza a porta 4000 do nosso localhost:

	$ mix phx.server


>Passo seguinte é executar o gerador do phoenix pra que ele crie toda a estrutura do html e elixir :

	$ mix phx.gen.html Web Lancamento lancamento tipo:string descricao:string valor:integer


>Apos gerado é necessario criar uma outra migration pra que ele implemente isso no banco de dados : 


	$ mix ecto.migrate


>Para verificar as router criadas ou existentes rodamos o comando :

	
	$ mix phx.routes


Apos executar o server , voce pode ter problemas com o uso da porta , erros do tipo " **[error] Failed to start Ranch listener ElixirwebWeb.Endpoint.HTTP in :ranch_tcp:listen([cacerts: :..., key: :..., cert: :..., port: 4000, ip: {127, 0, 0, 1}]) for reason :eaddrinuse (address already in use) "**

>Nesse caso o procedimento é verificar se a porta esta em uso 

	
	$ sudo netstat -lp


>e excluir:

	
	$ kill -9 34180
	

Como aplicação web voce pode utilizar framework Css como por exemplo o bootstrap ou tailwindcss. Nesse caso consulte a documentação para a instalação . No projeto fiz uso do bootstrap apenas para demonstração , a instalação seria via npm com o comando :

	$ npm install bootstrap jquey popper.js --prefix assets

