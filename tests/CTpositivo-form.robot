*** Settings ***
Documentation    Fluxo preenchimento correto do formulário de registro de estudantes
Library          SeleniumLibrary
Resource         ../resources/shared/setup_teardown.robot
Resource         ../resources/pages/automation-practice-form.robot
Test Setup       Acesso ao site
Test Teardown    Fechar o navegador

*** Test Cases ***

CT 01: Preenchimento correto do formulário de registro de estudantes
    [Documentation]    Cenário positivo: Fluxo preenchimento do formulário de registro de estudantes
    [Tags]             CT01
    Dado que o usuário esteja na tela do formulário de registro de estudantes
    Quando todos os campos são preenchidos corretamente
    E o usuário clica no botão 'Submit'
    Então o sistema deve exibir mensagem 'Thanks for submitting the form'