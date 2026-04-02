*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${URL_API}  https://restful-booker.herokuapp.com/booking


*** Keywords ***
Step 1: Consultar por id
    ${response}=  GET  ${URL_API}/11
    Set Test Variable    ${response}

 # Verificando os dados da reserva
Step 2: Verficar o first name
    ${firstnamevalue}=  Get From Dictionary    ${response.json()}    firstname
    Should Be Equal As Strings    ${firstnamevalue}    John
Step 3: Verficar o last name
    ${lastnamevalue}=  Get From Dictionary    ${response.json()}    lastname
    Should Be Equal As Strings    ${lastnamevalue}    Smith
Step 4: Verficar o preço
    ${totalpricevalue}=  Get From Dictionary    ${response.json()}    totalprice
    Should Be Equal As Numbers    ${totalpricevalue}    111
Step 5: Verficar o adicional
    ${additionalneedsvalue}=  Get From Dictionary    ${response.json()}    additionalneeds
    Should Be Equal As Strings    ${additionalneedsvalue}    Breakfast

    # Verificando se o depositpaid é true
Step 6: Verficar se o depositpaid é true
    ${depositpaid}=  Get From Dictionary    ${response.json()}    depositpaid
    Should Be True   ${depositpaid}

*** Test Cases ***
Cenário 1: Consultando os dados da reserva cadastrada por id
    Step 1: Consultar por id
    Step 2: Verficar o first name
    Step 3: Verficar o last name
    Step 4: Verficar o preço
    Step 5: Verficar o adicional
    Step 6: Verficar se o depositpaid é true