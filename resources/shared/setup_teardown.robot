*** Settings ***
Documentation    Arquivo referente a Setup e TearDown
Library          SeleniumLibrary

*** Variables ***
${browser}       chrome
${url}           https://demoqa.com/automation-practice-form
${options}       add_argument("--headless"); add_argument("--disable-gpu")

*** Keywords ***
Acesso ao site 
    Open Browser        url=${url}    browser=${browser}    options=${options} 
    Maximize Browser Window

Fechar o navegador
    Close Browser
    Log To Console  Teste finalizado