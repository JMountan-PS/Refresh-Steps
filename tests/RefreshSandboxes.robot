*** Settings ***
Library    QWeb
Resource                   ../resources/common.resource
Suite Setup                Setup Browser
Suite Teardown             End suite

*** Variables ***
@{sandbox_list}        DevTest1    DevTest2

*** Test Cases ***
Refresh Sandboxes From list
    [Documentation]    Iterate through the list variable above, refreshing each sandbox listed
    Home
    ClickText    Setup
    ClickText    Opens in a new tab
    SwitchWindow    NEW

    TypeText               Quick Find                  Sandbox        delay=2
    ClickText              Sandboxes                   delay=2
    
