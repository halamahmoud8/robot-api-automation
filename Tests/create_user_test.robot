*** Settings ***
Library    Collections
Resource   ../Resource/user_api.robot
Resource   ../Resource/variables.robot

*** Test Cases ***
Create And Delete User
   [Documentation]    create user, check response, get existing user, delete existing user
   Create ReqRes Session
 Create user
    ${user_id}=        Create User      ${USER_NAME}    ${JOB}
    ${user_data}=      Get User By ID   ${EXISTING_USER_ID}
    ${delete_status}=  Delete User      ${EXISTING_USER_ID}
