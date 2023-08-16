#robot -d ./logs Front/tests/register/register.robot
#robot -d ./logs -i happy Front/tests/register/register.robot             executa somente a tag informada
#robot -d ./logs -e happy Front/tests/register/register.robot         não executa somente a tag informada
#robot -d ./logs -i inv_email Front/tests/register/register.robot

*Settings*
Documentation                   Suite to test new user registration.

Library                         ../../factories
Resource                        ../resources/keywords.robot
Resource                        ./meta.robot

Test Setup                      Start Session
Test Teardown                   End Session

##robot -d ./Front/logs ./Front/tests/register/register.robot
*Test Cases*
Create new user
    [Tags]                      happy
    #Define qual lista de dados vai usar selecionando a função desejada aqui
    &{user}                     factory user successfully

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
    &{user}                     factory user wrong email

    Go To User Form
    Fill User Form              ${user}
    Select Jedi                 ${user}
    Check Accept comunications
    Submit User Form
    Toaster Message Should Be  Oops! O email é incorreto.