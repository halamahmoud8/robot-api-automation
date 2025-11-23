*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}        https://reqres.in
${SESSION_NAME}    reqres
${API_KEY}         reqres-free-v1

*** Keywords ***
Create ReqRes Session
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    Create Session    ${SESSION_NAME}    ${BASE_URL}    headers=${headers}    verify=${True}    disable_warnings=${True}

Send POST Request
    [Arguments]    ${url}    ${payload}    ${expected_status}=201
    ${response}=   Post On Session    ${SESSION_NAME}    ${url}    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}
    Return From Keyword    ${response}

Send GET Request
    [Arguments]    ${url}    ${expected_status}=200
    ${response}=   Get On Session    ${SESSION_NAME}    ${url}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}
    Return From Keyword    ${response}

Send DELETE Request
    [Arguments]    ${url}    ${expected_status}=204
    ${response}=   Delete On Session    ${SESSION_NAME}    ${url}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}
    Return From Keyword    ${response}