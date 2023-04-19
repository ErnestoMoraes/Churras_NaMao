# Desafio-Flutter - Ernesto Moraes
<img src="https://github.com/ErnestoMoraes/Desafio-Flutter/blob/main/desafio_flutter_front/assets/images_readme/todo_app.png" alt="Alt Text" height=300>

## Teste
 > Como parte do processo de seleção, gostaríamos de lhe apresentar um desafio para avaliar suas habilidades e conhecimentos em Flutter. <br> 
 > O desafio consiste em desenvolver uma funcionalidade específica para o nosso aplicativo carro-chefe, o Clube.on App. Você deve escolher UMA das seguintes funcionalidades para implementar:

 1 .Implementar uma nova forma de pagamento que seja segura e fácil de usar pelos nossos usuários. <br>
 2 .Criar um processo de reserva de churrasqueiras, permitindo que os usuários visualizem as churrasqueiras disponíveis em tempo real e façam suas reservas de forma rápida e eficiente.
 
 ### O Teste escolhido foi o número 2! Criar um app de reserva de Churrasqueira.
 
 ## Como executar o aplicativo?
 ### Etapa 1: Executar a API
 A API foi construida em Dart. Foi utilizado o package Json_Rest_Server que transforma um arquivo JSON em uma API que atende a requisições HTTP. Deixando o arquivo "funcional" e interativo. <br>
 
 Para isso siga os seguintes passos: <br>
 > Package: json_rest_server: ^1.5.4 => Versão usada! <br>
  1. Baixe o arquivo: desafio_api
  2. Ative o Json Rest Server pelo pub: ```dart pub global activate json_rest_server```
  3. Execute: ```json_rest_server run ou jrs run```
  5. Se aparecer: <br>
        Json Rest Server Server started, responding on: <br>
        http://localhost:8080/ <br>
        http://192.168.0.123:8080/ <br>
        
        ✨ Está rodando!!! <br>
  6. Para mais informações: https://pub.dev/packages/json_rest_server
  
 ### Etapa 2: Executar o Aplicativo
  1. Baixe o arquivo: desafio_front
  2. Insira na raiz do arquivo uma pasta nomeada de ``` .env```: <br>
      No arquivo ``` .env```, insira:  <br>
       ``` backend_base_url=http://(ip_máquina):8080```  ->  Altere pelo seu Endereço IPv4. <br>
  3. Rode o projeto front com o comando: ``` Flutter run```.
 
 ## Mais informações
 Ação feitas e não feitas:
  - [x] Login de usuário
  - [ ] Regrito de usuário
  - [x] Requisição a API via DIO
  - [x] Arquivo de configuração de tema geral do Aplicativo: DARK MODE
  - [x] Exibir produtos: Churrasqueiras
  - [x] Exbir card dizem se o produto já está reservado para hoje.
  - [x] Exibir tela de Detalhe de produto: Exibindo (Foto, Calendário, Legenda de cores e opção de Reservar Churrasqueira).
  - [ ] Poder des-reservar Churrasqueira.
  - [x] O usuário pode ver as Churrasqueiras cadastradas, mas precisa fazer login para reservar.
  - [x] Usando Provider
  - [x] Usando BloC
  - [ ] Tela (Minhas reservas) não continuada!
  - [ ] Testes
  
  ## As Churrasquerias e Usuários estão sendo salvas com o seguinte formato de informações:
  ### Usuário: 
  ```
        {
            "id": 0,
            "name": "Teste",
            "email": "usuario_teste@gmail.com",
            "password": "usuario_teste"
        }
    ],
  ```
  ### Churrasqueira:
  ```
  {
            "id": 0,
            "title": "Churrasqueira",
            "description": "Churrasqueira a gás",
            "photo": "https://montcalefatores.com.br/wp-content/uploads/2022/03/foto-1-calefator-3-1.jpg",
            "rents": [
                {
                    "id": 0,
                    "userId": 0,
                    "productId": 0,
                    "dateRent": "2023-04-17 00:00:00.000Z"
                },
                {
                    "id": 0,
                    "userId": 0,
                    "productId": 0,
                    "dateRent": "2023-04-18 16:33:07.235190"
                },
                {
                    "id": 0,
                    "userId": 0,
                    "productId": 0,
                    "dateRent": "2023-04-27 00:00:00.000Z"
                },
                {
                    "id": 0,
                    "userId": 0,
                    "productId": 0,
                    "dateRent": "2023-04-30 00:00:00.000Z"
                }
            ]
        },
  ```
  

## ⚙️ Para logar:
  Não será possivel cadastrar um noco usuário! <br>
  Portanto, utilize esses dados para acessar: <br>
  Email: usuario_teste@gmail.com <br>
  Senha: usuario_teste <br>

<div align="center">
  <br/>
  <br/>
  <br/>
    <div>
      <h1>Open Source</h1>
      <sub>Copyright © 2023 - <a href="https://github.com/ErnestoMoraes">ErnestoMoraes</sub></a>
    </div>
    <br/>
    😁
</div>







