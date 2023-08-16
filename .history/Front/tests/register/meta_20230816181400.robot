*Settings*
Documentation                       Suite with keyword for register test

Resource                            data.robot

*** Keywords ***
Go To Home Page
    Go To                           ${BASE_URL}
    #Puxou da Keyord principal chamando o Resource
    Wait For Elements State         ${element_carousel}                       visible                         5

Go To User Form
    Click                           ${btn_new_user} 
    Wait For Elements State         ${txt_title_new_user}                     visible                         5

Fill User Form
   [Arguments]                      ${user}
    #Não está puxando o user de nenhum lugar, só está deixando pré definido e depois vai chamar de verdade o user no metodo criado no arquivo que puxa esse metodo.

    Fill Text                       ${fld_user_name}                          ${user}[name]
    Fill Text                       ${fld_user_email}                         ${user}[email]
    Select Options By               ${fld_user_ordem}                         text                             ${user}[ordem]
    #Usando a variavel na ordem deixa mais flexivel para diferentes cenarios quando usado o arquivo que puxa esse metodo.
    Select Birth Date               ${user}[bdate]
    #O metodo Select Birth Date está criado abaixo.
    Fill Text                       ${fld_user_insta}                         ${user}[instagram]

Select Jedi      
    [Arguments]                     ${user}
    Click                           xpath=//input[@value="${user}[tpjedi]"]/..//span[@class="check"]
    #Usando a variavel no xpath deixa mais flexivel para diferentes cenarios quando usado o arquivo que puxa esse metodo.

Check Accept comunications
    Click                           ${fld_accept_comunications}

Submit User Form
    Click                           ${btn_add_user}   

Toaster Message Should Be
    [Arguments]                     ${msg}
    #Cria uma variabel padrão aqui e no outro arquivo especifica a mensagem dependendo do cenario que vai utilizar. 
    
    Wait For Elements State         ${txt message}                            visible                         5
    Get Text                        ${txt message}                            equal                           ${msg}                                                               

Select Birth Date
    [Arguments]                     ${text_date}
    #Aqui está criando uma variavél que será definido o valor quando usado o arquivo que puxa esse metodo.

    @{date}                         Split String                                                            ${text_date}                                                            -
    #Esse metodo é preciso pois na aplicação não é possível digitar a data somente selecionar numa pop-up de calendário. 

    Click                           ${fld_data_nascimento}  
    # Primeiro clica no input para abrir o calendário. 
    Select Options By               ${fld_select_month}  
    ...                             text                                                                    ${date}[0]
    #  Em cima foi selecionado para quando utilizar a variavel em texto, fazer um slpit antes de puxar e transformar o valor em um array, e aqui pode selecionar qual index do array quer puxar o valor. 

    Select Options By               ${fld_select_year} 
    ...                             value                                                                   ${date}[1] 
    #  Aqui está puxando outro index do array.  

    Click                           xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"] 
    #  Aqui está puxando outro index do array e colocando dentro do seletor xpath deixando mais facíl de usar em diferentes cenarios.  

User Should Be Visible
    [Arguments]                     ${user}
    ${element}                      Set Variable                                                            xpath=//td[contains(text(), "${user}[email]")]/..



    Wait For Elements State         ${element}                              visible                         5
    Get Text                        ${element}                              contains                        ${user}[name]     
    Get Text                        ${element}                              contains                        ${user}[instagram]


#tirar print do código HTML no momento em que precisa(bom para elmt que somem com o tempo)
    # Sleep                       1
    # ${html}                     Get Page Source
    # Log                         ${html}  