*Settings*
Documentation                   Suite to test new user registration.

Resource                        ./Base/keywords.robot
Test Setup                      Start Session
Test Teardown                   End Session

*Test Cases*
Create new user

    Click                       text=Novo
    Wait For Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...                         visible                                                                 5
    Fill Text                   css=input[placeholder^="Nome"]                                          Jedi Cavalher
    Fill Text                   css=input[placeholder="Email"]                                          Jedi@test.com
    Select Options By           css=.ordem select                                                       text                       Jedi
    Click                       xpath=//input[@value="Cavaleiro Jedi"]/..//span[@class="check"]
    Select Birth Date           abril                                                                   1993                        19
    Fill Text                   id=insta                                                                @jedi-cavalher
    Click                       xpath=//input[@name="comunications"]/../span[@class="check"]
    Click                       css=button >> text=Cadastrar
    Wait For Elements State     css=.toast div >> text=Usuário cadastrado com sucesso!    
    ...                         visible                                                                 5          


#tirar print do código HTML no momento em que precisa(bom para elemento que somem com o tempo)
    # Sleep                       1
    # ${html}                     Get Page Source
    # Log                         ${html}  


*Keywords*
Select Birth Date
    [Arguments]                 ${month}                            ${year}                             ${day}

    Click                       css=input[placeholder="Data de nascimento"]
    Select Options By           xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                         text                                                                    ${month}  
    Select Options By           xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                         value                                                                   ${year}  
    Click                       xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${day}"]
