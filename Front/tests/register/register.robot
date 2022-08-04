*Settings*
Documentation                   Suite to test new user registration.

Resource                        ${EXECDIR}/Front/tests/resources/keywords.robot
Resource                        keywords.robot
Test Setup                      Start Session
Test Teardown                   End Session

##robot -d ./Front/logs ./Front/tests/register/register.robot
*Test Cases*
Create new user
    [Tags]                      happy

    &{user}                     Create Dictionary
    ...                         name=Jedi Cavalher
    ...                         email=Jedi@test.com
    ...                         ordem=Jedi
    ...                         tpjedi=Cavaleiro Jedi 
    ...                         bdate=abril-1993-19
    ...                         instagram=@jedi-cavalher

    Go To User Form
    Fill User Form              ${user}
    Select Jedi                 ${user}
    Check Accept comunications
    Submit User Form
    Toaster Message Should Be  Usuário cadastrado com sucesso!
  
Incorrect e-mail
    [Tags]                      inv_email

    &{user}                     Create Dictionary
    ...                         name=Dath Cavalher
    ...                         email=Dath-test.com
    ...                         ordem=Jedi
    ...                         tpjedi=Cavaleiro Jedi 
    ...                         bdate=abril-1993-19
    ...                         instagram=@dath-cavalher

    Go To User Form
    Fill User Form              ${user}
    Select Jedi                 ${user}
    Check Accept comunications
    Submit User Form
    Toaster Message Should Be  Oops! O email é incorreto.


 

