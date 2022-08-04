
#tirar print do código HTML no momento em que precisa(bom para elemento que somem com o tempo)
    # Sleep                       1
    # ${html}                     Get Page Source
    # Log                         ${html}  


*Keywords*
Select Birth Date
    [Arguments]                 ${text_date}
    @{date}                     Split String                                                            ${text_date}                                                            -

    Click                       css=input[placeholder="Data de nascimento"]
    Select Options By           xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                         text                                                                    ${date}[0]  
    Select Options By           xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                         value                                                                   ${date}[1]  
    Click                       xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]
