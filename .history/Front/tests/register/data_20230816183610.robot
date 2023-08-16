*Settings*
Documentation                       Suite with elements HTML  for register test

*** Variables ***
${BASE_URL}                     https://yodapp-testing.vercel.app/
${element_carousel}             css=.carousel
${btn_new_user}                 text=Novo
${txt_title_new_user}           css=.card-header-title >> text=Cadastrar novo usuário

#Form ADD
${fld_user_name}                css=input[name="nome"]
${fld_user_email}               css=input[name="email"] 
${fld_user_ordem}               css=.ordem select 
${fld_user_insta}               id=insta
#${fld_selected_Jedi}            xpath=//input[@value="${user}[tpjedi]"]/..//span[@class="check"]
${fld_accept_comunications}     xpath=//input[@name="comunications"]/../span[@class="check"]
${btn_add_user}                 css=button >> text=Cadastrar

${fld_data_nascimento}          css=input[name="Data de nascimento"]
${fld_select_month}             xpath=(//header[@class="datepicker-header"]//select)[1]
${fld_select_year}              xpath=(//header[@class="datepicker-header"]//select)[2]
#${fld_select_day}               xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]


#Validate
${txt message}                  css=.toast div
#${txt_correct_user}             xpath=//td[contains(text(), "${user}[email]")]/..