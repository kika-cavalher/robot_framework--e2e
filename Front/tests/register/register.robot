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

    Click                       text=Novo
    Wait For Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...                         visible                                                                 5
    Fill Text                   css=input[placeholder^="Nome"]                                          Jedi Cavalher
    Fill Text                   css=input[placeholder="Email"]                                          Jedi@test.com
    Select Options By           css=.ordem select                                                       text                       Jedi
    Click                       xpath=//input[@value="Cavaleiro Jedi"]/..//span[@class="check"]
    Select Birth Date           abril-1993-19
    Fill Text                   id=insta                                                                @jedi-cavalher
    Click                       xpath=//input[@name="comunications"]/../span[@class="check"]
    Click                       css=button >> text=Cadastrar
    Wait For Elements State     css=.toast div >> text=Usuário cadastrado com sucesso!    
    ...                         visible                                                                 5          


Incorrect e-mail
    [Tags]                      inv_email

    Click                       text=Novo
    Wait For Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...                         visible                                                                 5
    Fill Text                   css=input[placeholder^="Nome"]                                          Jedi Cavalher
    Fill Text                   css=input[placeholder="Email"]                                          Jedi$test.com
    Select Options By           css=.ordem select                                                       text                       Jedi
    Click                       xpath=//input[@value="Cavaleiro Jedi"]/..//span[@class="check"]
    Select Birth Date           abril-1993-19
    Fill Text                   id=insta                                                                @jedi-cavalher
    Click                       xpath=//input[@name="comunications"]/../span[@class="check"]
    Click                       css=button >> text=Cadastrar
    Wait For Elements State     css=.toast div >> text=Oops! O email é incorreto.   
    ...                         visible                                                                 5          

