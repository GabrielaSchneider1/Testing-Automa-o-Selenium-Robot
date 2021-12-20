*** Variables ***
${SITE}             https://saucedemo.com
${NAVEGADOR}        Chrome
${CAMPO_USUARIO}    css=#user-name
${CAMPO_SENHA}      css=#password
${BOTAO_LOGIN}      css=#login-button
${USUARIO}          standard_user
${SENHA}            secret_sauce
${PRODUTO}          css=#item_4_title_link > div
${ADICIONAR}        css=#add-to-cart-sauce-labs-backpack
${CARRINHO}         css=#shopping_cart_container > a
${CHECKOUT}         css=#checkout
${CAMPO_NOME}       css=#first-name
${CAMPO_SOBRENOME}  css=#last-name
${CAMPO_CEP}        css=#postal-code
${BOTAO_CONTINUE}   css=#continue
${NOME}             Gabriela
${SOBRENOME}        Schneider
${CEP}              00000
${BOTAO_FINISH}     css=#finish
${CONFIRMACAO}      css=#checkout_complete_container > h2
${MENSAGEM}         THANK YOU FOR YOUR ORDER

*** Keywords ***
Abrir a loja
  Open Browser  ${SITE}               ${NAVEGADOR}
  Maximize Browser Window
  Set Selenium Speed  0.75

Fazer login
  Input Text        ${CAMPO_USUARIO}       ${USUARIO}
  Input Text        ${CAMPO_SENHA}         ${SENHA}
  Wait and Click                           ${BOTAO_LOGIN}

Selecionar produto e colocar no carrinho
  Wait and Click    ${PRODUTO}
  Wait and Click    ${ADICIONAR}

Abrir o carrinho e clicar em Checkout  
  Wait and Click    ${CARRINHO}
  Wait and Click    ${CHECKOUT}

Preencher os dados de entrega e clicar em continue
  Input Text        ${CAMPO_NOME}          ${NOME}      
  Input Text        ${CAMPO_SOBRENOME}     ${SOBRENOME}
  Input Text        ${CAMPO_CEP}           ${CEP}
  Wait and Click    ${BOTAO_CONTINUE}

Finalizar a compra e confirmar
  Wait and Click    ${BOTAO_FINISH}
  Element Should Contain  ${CONFIRMACAO}   ${MENSAGEM}

Wait and Click
  [Arguments]                    ${ELEMENTO}
  Wait Until Element is Visible  ${ELEMENTO}
  Click Element                  ${ELEMENTO}
