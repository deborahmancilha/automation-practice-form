*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR

*** Variables ***
${form}              css=div.pattern-backgound.playgound-header > div
${nome}              id=firstName
${sobrenome}         id=lastName
${email}             id=userEmail
${gender}            css=label[for="gender-radio-2"]
${mobile}            id=userNumber
${dateofbirth}       id=dateOfBirthInput 
${clickextra}        css=#genterWrapper > div.col-md-3.col-sm-12
${subjects}          css=#subjectsContainer > div
${dadomatéria01}     M
${autocomplete}      css=div.subjects-auto-complete__menu
${hobbies01}         css=#hobbiesWrapper > div.col-md-9.col-sm-12 > div:nth-child(2) > label
${hobbies02}         css=#hobbiesWrapper > div.col-md-9.col-sm-12 > div:nth-child(1) > label
${hobbies03}         css=#hobbiesWrapper > div.col-md-9.col-sm-12 > div:nth-child(3) > label
${picture}           id=uploadPicture
${arquivo}           C:/automation-practice-form/automation-practice-form/resources/shared/files/perfil.jpg
${currentaddress}    id=currentAddress
${state}             id=state
${selecaoestado}     css=#state > div
${city}              css=#city > div > div.css-1hwfws3
${selecaocidade}     css=#city > div 
${clickfora}         css=#genterWrapper > div.col-md-3.col-sm-12
${submit}            id=submit
${sucesso}           id=example-modal-sizes-title-lg



*** Keywords ***

#CT 01: Preenchimento correto do formulário de registro de estudantes
Dado que o usuário esteja na tela do formulário de registro de estudantes
    Wait Until Element Is Visible    ${form} 
    Element Should Contain           ${form}    Practice Form

Quando todos os campos são preenchidos corretamente
    #Name
    ${dadonome}                FakerLibrary.First Name
    Input Text                 ${nome}    ${dadonome}
    ${dadosobrenome}           FakerLibrary.Last Name
    Input Text                 ${sobrenome}     ${dadosobrenome}

    #Email
    ${dadoemail}                FakerLibrary.Free Email
    Input Text                  ${email}    ${dadoemail}
    
    #Gender
    Click Element               ${gender}   

    #Mobile
    ${dadomobile}               FakerLibrary.Numerify  text=##########
    Input Text                  ${mobile}     ${dadomobile}

    #Date of Birth
    ${dadonascimento}          FakerLibrary.Date Of Birth
    Input Text                 ${dateofbirth}    ${dadonascimento} 
    Click Element              ${clickextra}  
    
    #Subjects
    Execute JavaScript                  window.scrollTo(0, document.querySelector('#subjectsContainer > div').getBoundingClientRect().top)
    Wait Until Element Is Visible       ${subjects} 
    Press Keys                          ${subjects}    ${dadomatéria01}   
    Wait Until Element Is Visible       ${autocomplete}    
    Click Element                       ${autocomplete}

    #Hobbies
    Click Element                ${hobbies01}
    Click Element                ${hobbies02}
    Click Element                ${hobbies03}

    #Picture
    Choose File                  ${picture}    ${arquivo}

    #Current Address
    ${dadoencereco}              FakerLibrary.Address
    Input Text                   ${currentaddress}    ${dadoencereco}

   # State and City
    Execute JavaScript        document.body.style.zoom = '0.5'
    Sleep                     3s

    # Validação para State
    ${validacaostate}            Element Should Be Visible    ${state} 
    ${validacaoselecaoestado}    Element Should Be Visible    ${selecaoestado}

    Run Keyword If    ${validacaostate}           Click Element    ${state} 
    Run Keyword If    ${validacaoselecaoestado}   Click Element    ${selecaoestado}  

    # Validação para City
    ${validacaocity}             Element Should Be Visible    ${city} 
    ${validacaoselecaocidade}    Element Should Be Visible    ${selecaocidade}
    Run Keyword If    ${validacaocity}               Click Element    ${city}   
    Run Keyword If    ${validacaoselecaocidade}      Click Element    ${selecaocidade} 

  
E o usuário clica no botão 'Submit'
    Execute JavaScript                            document.getElementById('submit').click();
    Sleep                                         5s


Então o sistema deve exibir mensagem 'Thanks for submitting the form'
    Element Should Contain    ${sucesso}    Thanks for submitting the form
    Capture Page Screenshot
 