*** Settings ***
Library  SeleniumLibrary
Resource   ./pratica.resource

*** Test Cases ***
Processo de compra na loja Sauce Demo
  Abrir a loja
  Fazer login
  Selecionar produto e colocar no carrinho
  Abrir o carrinho e clicar em Checkout
  Preencher os dados de entrega e clicar em continue
  Finalizar a compra e confirmar