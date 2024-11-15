*** Settings ***
Library    QWeb
Resource                   ../resources/common.resource
Suite Setup                Setup Browser
Suite Teardown             End suite

*** Variables ***
@{sandbox_list}        DevTest1    DevTest2
...                    DevTest3    Int
...                    QA          UAT

*** Test Cases ***
Refresh Sandboxes From list
    [Documentation]    Iterate through the list variable above, refreshing each sandbox listed
    Home
    ClickText    Setup
    ClickText    Opens in a new tab
    SwitchWindow    NEW

    TypeText               Quick Find                  Sandbox        delay=2
    ClickText              Sandboxes                   delay=2

    #For Each Sandbox in the list above, Refresh
    FOR  ${sandbox}  IN  @{sandbox_list}
        ClickText    ${sandbox}                        anchor=Name
        Sleep        4s
        ${refresh_unavailable}=                        IsText           days remaining of
        IF                        '${refresh_unavailable}'=='False' 
            ClickText                 Refresh
        END           
        ClickText                     Sandboxes                        delay=2
    END
    
