*** Settings ***
Library    Collections
Resource   variables.robot
Resource   api_client.robot

*** Keywords ***
Create User
    [Arguments]    ${name}    ${job}
    ${payload}=    Create Dictionary    name=${name}    job=${job}
    ${response}=   Send POST Request    /api/users    ${payload}    201
    Should Not Be Empty    ${response.json()['id']}
    Should Be Equal        ${response.json()['name']}    ${name}
    Should Be Equal        ${response.json()['job']}     ${job}
    [Return]    ${response.json()['id']}

Get User By ID
    [Arguments]    ${user_id}
    ${response}=   Send GET Request    /api/users/${user_id}    200
    [Return]       ${response.json()}

Delete User
    [Arguments]    ${user_id}
    ${response}=   Send DELETE Request    /api/users/${user_id}    204
    [Return]       ${response.status_code}