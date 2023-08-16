#robot -d ./Front/.logs Front/tests/
#robot -d ./Front/.logs -i happy Front/tests/             executa somente a tag informada
#robot -d ./Front/.logs -e happy Front/tests/         não executa somente a tag informada
#robot -d ./Front/.logs -i inv_email Front/tests/

*** Settings ***
Documentation                   Suite to test new user registration.

Library                         ../factories/users.py
Resource                        ../resources/default/base.robot
Resource                        ../resources/register/meta.robot

Test Setup                      Start Session
Test Teardown                   End Session

*** Test Cases ***
Create new user
    [Tags]                      happy
    #Define qual lista de dados vai usar selecionando a função desejada aqui
    ${user}                     factory user successfully
    # o & significa que é uma super variavel, uma lista. 

    Go To User Form
    Fill User Form              ${user}
    #Precisa passar que a lista de user que carregou será usado nesse metodo, como definido na criação do mesmo. 
    Select Jedi                 ${user}
    Check Accept comunications
    Submit User Form
    Toaster Message Should Be   Usuário cadastrado com sucesso!
    Go To Home Page
    User Should Be Visible      ${user}
  
Incorrect e-mail
    [Tags]                      inv_email
    ${user}                     factory user wrong email

    Go To User Form
    Fill User Form              ${user}
    Select Jedi                 ${user}
    Check Accept comunications
    Submit User Form
    Toaster Message Should Be  Oops! O email é incorreto.