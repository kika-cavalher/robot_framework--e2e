*Settings*
Documentation                   Suite to test new user registration.

Library                         ${EXECDIR}/Front/tests/resources/factories/users.py

Resource                        ${EXECDIR}/Front/tests/resources/keywords.robot
Resource                        keywords.robot
Test Setup                      Start Session
Test Teardown                   End Session

##robot -d ./Front/logs ./Front/tests/register/register.robot
*Test Cases*
Create new user
    [Tags]                      happy

    &{user}                     factory user successfully

    Go To User Form
    Fill User Form              ${user}
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



 

