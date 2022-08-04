*Settings*
Documentation                   Suite with keyword for register test

*Keywords*
Go To User Form
    Click                           text=Novo
    Wait For Elements State         css=.card-header-title >> text=Cadastrar novo usuário
    ...                             visible                                                                 5

Fill User Form
   [Arguments]                      ${user}

    Fill Text                       css=input[name="nome"]                                              ${user}[name]
    Fill Text                       css=input[name="email"]                                             ${user}[email]
    Select Options By               css=.ordem select                                                   text                       ${user}[ordem]
    Select Birth Date               ${user}[bdate]
    Fill Text                       id=insta                                                            ${user}[instagram]

Select Jedi      
    [Arguments]                     ${user}
    Click                           xpath=//input[@value="${user}[tpjedi]"]/..//span[@class="check"]

Check Accept comunications
    Click                           xpath=//input[@name="comunications"]/../span[@class="check"]

Submit User Form
    Click                           css=button >> text=Cadastrar

Toaster Message Should Be
    [Arguments]                     ${msg}
        Wait For Elements State     css=.toast div >> text=${msg}    
    ...                             visible    

Select Birth Date
    [Arguments]                     ${text_date}
    @{date}                         Split String                                                            ${text_date}                                                            -

    Click                           css=input[name="Data de nascimento"]
    Select Options By               xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                             text                                                                    ${date}[0]  
    Select Options By               xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                             value                                                                   ${date}[1]  
    Click                           xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]


#tirar print do código HTML no momento em que precisa(bom para elemento que somem com o tempo)
    # Sleep                       1
    # ${html}                     Get Page Source
    # Log                         ${html}  