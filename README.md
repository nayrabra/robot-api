# Automação de Testes de API com Robot Framework

Este projeto utiliza **Robot Framework** e **RequestsLibrary** para automatizar testes de API na aplicação Restful Booker.

Os testes validam requisições GET, status code da resposta e os dados retornados pela API.

---

## Tecnologias Utilizadas

* Robot Framework
* RequestsLibrary
* Python
* Collections Library

---

## Estrutura do Projeto

```
├── buscaporget.robot
├── getporid.robot
├── interactive_console_output.xml
├── log.html
├── output.xml
├── report.html
```

---

## API Utilizada

API pública utilizada para os testes:

```
https://restful-booker.herokuapp.com/booking
```

---

## Funcionalidades Testadas

### Teste GET da API

* Validar se a requisição GET foi executada com sucesso
* Validar status code 200

### Teste GET por ID

* Consultar reserva específica por ID
* Validar firstname
* Validar lastname
* Validar totalprice
* Validar additionalneeds
* Validar se depositpaid é true

---

## Fluxos Automatizados

### Cenário 1: Validando GET da API

1. Realizar requisição GET
2. Validar se a resposta foi bem-sucedida
3. Validar status code 200

### Cenário 2: Validando dados da reserva

1. Consultar reserva por ID
2. Validar nome
3. Validar sobrenome
4. Validar preço total
5. Validar necessidade adicional
6. Validar pagamento realizado

---

## Dependências e Configuração

> É necessário ter Python instalado.

Instale o Robot Framework:

```
pip install robotframework
```

Instale a RequestsLibrary:

```
pip install robotframework-requests
```

---

## Como Executar os Testes

Execute todos os testes:

```
robot tests/
```

Execute um arquivo específico:

```
robot tests/get_booking.robot
```

---

## Exemplo de Teste

```robotframework 
${response}=  GET  ${URL_API}/11

${firstnamevalue}=  Get From Dictionary    ${response.json()}    firstname

Should Be Equal As Strings    ${firstnamevalue}    John
```

---

## Sobre os Testes

Os testes foram desenvolvidos utilizando:

* `RequestsLibrary` para requisições HTTP
* `Collections` para manipulação de dicionários
* Keywords reutilizáveis
* Validações de status code e payload da resposta

O projeto tem como foco validar endpoints REST através de automação de testes de API, seguindo boas práticas de qualidade de software.
