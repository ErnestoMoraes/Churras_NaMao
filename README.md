# Desafio-Flutter - Ernesto Moraes

![Desafio-Flutter](https://github.com/ErnestoMoraes/Desafio-Flutter/blob/main/desafio_flutter_front/assets/images_readme/app.png)

Participei do Desafio Flutter, uma oportunidade de demonstrar minhas habilidades e conhecimentos em Flutter. Durante o desafio, tive a oportunidade de desenvolver uma funcionalidade para o Clube.on App, nosso aplicativo principal. Escolhi implementar a funcionalidade de reserva de churrasqueiras, permitindo que os usuários visualizem as churrasqueiras disponíveis em tempo real e façam suas reservas de forma rápida e eficiente.

## Como executar o aplicativo?

### Etapa 1: Executar a API

A API foi construída em Dart usando o pacote Json_Rest_Server, que transforma um arquivo JSON em uma API que atende às requisições HTTP. Siga os passos abaixo para executar a API:

1. Baixe o arquivo: desafio_api.
2. Ative o Json Rest Server usando o comando: `dart pub global activate json_rest_server`.
3. Execute o comando: `json_rest_server run` ou `jrs run`.
4. Verifique se a API está sendo executada corretamente. O servidor deve responder em: 
   - `http://localhost:8080/`
   - `http://192.168.0.123:8080/`

### Etapa 2: Executar o Aplicativo

1. Baixe o arquivo: desafio_front.
2. Na raiz do projeto, crie uma pasta chamada `.env`.
3. Dentro da pasta `.env`, crie um arquivo chamado `.env` (sem extensão) e adicione a seguinte configuração:
   ```
   backend_base_url=http://(ip_máquina):8080
   ```
   Certifique-se de substituir `(ip_máquina)` pelo seu Endereço IPv4.
4. Execute o projeto com o comando: `flutter run`.

## Mais informações

Ações realizadas e pendentes:
- [x] Login de usuário
- [ ] Registro de usuário
- [x] Requisição à API usando Dio
- [x] Arquivo de configuração para tema escuro do aplicativo
- [x] Exibição de produtos (churrasqueiras)
- [x] Exibição do status de reserva de cada churrasqueira no dia atual
- [x] Tela de detalhes do produto com informações (foto, calendário, legenda de cores e opção de reservar churrasqueira)
- [ ] Possibilidade de cancelar reserva de churrasqueira
- [x] Os usuários podem visualizar as churrasqueiras cadastradas, mas precisam fazer login para reservar
- [x] Utilização do Provider
- [x] Utilização do BloC
- [ ] Tela "Minhas reservas" não concluída
- [ ] Testes

As informações de churrasqueiras e usuários estão sendo salvas com o seguinte formato:

### Usuário:
```
{
    "id": 0,
    "name": "Teste",
    "email": "usuario_teste@gmail.com",
    "password": "usuario_teste"
}
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
}
```

## ⚙️ Para fazer login:

Não é possível cadastrar um novo usuário, então utilize as seguintes credenciais para fazer login:

Email: ``usuario_teste@gmail.com`` <br>
Senha: ``usuario_teste``

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
