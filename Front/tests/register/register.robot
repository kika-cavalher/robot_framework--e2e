*Settings*
Documentation                   Suite to test new user registration.

Resource                        ${EXECDIR}/Front/tests/resources/keywords.robot
Resource                        keywords.robot
Test Setup                      Start Session
Test Teardown                   End Session

#robot -d ./Front/logs -i inv_email ./Front/test/register/register.robo
*Test Cases*
Create new user
    [Tags]                      happy

    Go To User Form
    Fill User Form              Jedi Cavalher        Jedi@test.com        Jedi          abril-1993-19               @jedi-cavalher
    Select Jedi                 Cavaleiro Jedi 
    Check Accept comunications
    Submit User Form
    Toaster Message Should Be  Usuário cadastrado com sucesso!  
  
Incorrect e-mail
    [Tags]                      inv_email

    Go To User Form
    Fill User Form              Jedi Cavalher        Jedi$test.com        Jedi          abril-1993-19               @jedi-cavalher
    Select Jedi                 Cavaleiro Jedi 
    Check Accept comunications
    Submit User Form
    Toaster Message Should Be  Oops! O email é incorreto.   
 

