# *** Settings ***
# Resource                   ../resources/common.resource
# Suite Setup                Setup Browser
# Suite Teardown             End suite

# *** Comments ***
# This file acts as a starting template for post-refresh tasks.
# In order to benefit from this file, you will need to complete the following:
# 1. Create Test Job Variables for the following:
# --- 1a. "username", "password", and "login_url". Use a production-env credential with sufficient access to complete all refresh-step tasks
# --- 1b. "MY_SECRET". This will house a MFA QR-code for one time password generation, if needed
# --- 1c. "consumer_key" and "consumer_secret". These will house Oauth connected app credentials if API is to be leveraged
# 2. Adjust the variables in the Variables section below. Replace information as necessary
# 3. Correct the script below to meet your needs:
# --- 3a. Start Live Testing. Initiate a sandbox refresh.
# --- 3b. Execute the script below, one step at a time.
# ------ 3bi. Take note of any step that did not work how you wished
# ------ 3bii. Take note of any functionality that is missing
# ------ 3biii. Take note of any functionality that is not needed
# 4. Run the script
# --- 4a. You may need to adust variables in the Variables section for each run
# --- 4b. You can run this file from Live Testing for instant troubleshooting capabilities
# --- 4c. Alternatively, you can run this file asyncronously using loops and list variables to further automate your processes

# *** Variables ***
# ${message}                 A Copado Robot wrote this message!
# ${sampleApex}              System.Debug('${message}');

# ${remote_site_name}    AA_Example
# ${remote_site_url}    https://updatedexample.new

# *** Test Cases ***
# Update Remote Site Settings
#     [Tags]                 Deployment Automation
#     Home
#     GoTo                   ${login_url}lightning/setup/SetupOneHome/home
#     TypeText               Quick Find                  Remote Site Settings        delay=2
#     ClickText              Remote Site Settings        delay=6
#     #Retry logic has been implemented, this will attempt to refresh the page three times.
#     ${edit_success}=       Set Variable                False
#     FOR                    ${i}                        IN RANGE                    3
#         ClickText          Edit                        delay=10
#         ${edit_success}=                               Run Keyword And Return Status                           VerifyText     Remote Site Name    timeout=5
#         Exit For Loop If                               ${edit_success}
#         RefreshPage
#         Sleep              2
#         Log                Edit context not opened, retrying...
#     END
#     #If we fail three times in a row, fail the test case and log an error
#     Run Keyword If         not ${edit_success}         Fail                        Failed to open edit context after 3 attempts

#     TypeText               Remote Site Name            AA_Example
#     TypeText               Remote Site URL             https://updatedexample.new
#     ClickCheckbox          Disable Protocol Security                               on
#     TypeText               Description                 This description has been updated by a robot!
#     LogScreenshot
#     ClickText              Cancel
# Use developer console to Execute Anonymous Apex
#     [Tags]                 Deployment Automation
#     [Documentation]        This test case executes Apex code from the developer console
#     ...                    and verifies that the log accurately reflects our input.
#     ...                    More complex apex scripts can be stored as a .apex file and called directly using
#     ...                    the ExecuteApex keyword.
#     Home
#     ClickText              Setup
#     ClickText              Developer Console
#     SwitchWindow           NEW
#     VerifyText             Query Editor
#     ClickText              Debug
#     VerifyText             Open Execute Anonymous Window
#     ClickText              Open Execute Anonymous Window
#     TypeText               Enter Apex Code             ${sampleApex}
#     ClickText              Open Log
#     VerifyText             Execute                     anchor=Open Log
#     ClickText              Execute                     anchor=Open Log
#     VerifyText             Filter
#     TypeText               Filter                      USER_DEBUG                  delay=2
#     VerifyText             ${message}                  delay=3
#     LogScreenshot
#     CloseWindow

# Execute Apex from File
#     Home
#     Authenticate           ${consumer_key}             ${consumer_secret}          ${username}                 ${password}
#     ${results}=            ExecuteApex                 ${CURDIR}/sampleApex.apex                               is_file=True

# Update Session Settings
#     [Tags]                 Deployment Automation
#     Home
#     GoTo                   ${login_url}lightning/setup/SetupOneHome/home
#     TypeText               Quick Find                  session
#     VerifyText             Session Settings
#     ClickText              Session Settings
#     Sleep                  3
#     ScrollTo               Set the session security and session expiration
#     ClickCheckbox          Disable session timeout warning popup                   on
#     ClickCheckbox          Enforce login IP ranges on every request                on
#     ScrollTo               Lightning Login
#     ClickCheckbox          Allow only for users with the Lightning Login User permission                       on
#     ScrollTo               Session Security Levels
#     ClickText              Multi-Factor Authentication                             partial_match=false
#     ClickElement           //*[@title\="Add"]
#     LogScreenShot
#     Clicktext              Cancel

# Enable/Disable Einstein
#     [Tags]                 Deployment Automation
#     Home
#     GoTo                   ${login_url}lightning/setup/SetupOneHome/home
#     TypeText               Quick Find                  Einstein
#     ClickText              Settings                    anchor=Einstein Discovery
#     VerifyText             Enable Decision Optimization (Beta)
#     ClickCheckbox          Enable Decision Optimization (Beta)EnabledDisabled      on
#     VerifyText             Enabled
#     ClickCheckbox          Enable Decision Optimization (Beta)EnabledDisabled      off
#     VerifyText             Disabled


# Enable/Disable Triggers
#     [Tags]                 Deployment Automation
#     Home
#     GoTo                   ${login_url}lightning/setup/SetupOneHome/home
#     TypeText               Quick Find                  Apex Triggers
#     VerifyText             Apex Triggers
#     ClickText              Apex Triggers
#     VerifyText             This page allows you to view and modify all the triggers                            timeout=120
#     VerifyText             AccountTriggerExample
#     ClickText              AccountTriggerExample
#     VerifyText             Apex Trigger Detail
#     ClickText              Edit
#     ClickCheckbox          is active                   on
#     VerifyCheckboxValue    is active                   on
#     ClickCheckbox          is active                   off
#     VerifyCheckboxValue    is active                   off
#     ClickText              Save





# Enable/Disable Validation Rules
#     [Tags]                 Deployment Automation
#     Home
#     GoTo                   ${login_url}lightning/setup/SetupOneHome/home
#     TypeText               Quick Find                  Object Manager
#     VerifyText             Object Manager
#     ClickText              Object Manager
#     VerifyText             Account
#     ClickText              Account
#     VerifyText             Validation Rules
#     ClickText              Validation Rules
#     VerifyText             Example_Validation
#     ClickText              Example_Validation
#     VerifyText             Account Validation Rule
#     ClickText              Edit
#     ClickCheckbox          Active                      on
#     VerifyCheckboxValue    Active                      on
#     ClickCheckbox          Active                      off
#     VerifyCheckboxValue    Active                      off
#     ClickText              Save

# Enable/Disable Workflow Rules
#     [Tags]                 Deployment Automation
#     Home
#     GoTo                   ${login_url}lightning/setup/SetupOneHome/home
#     TypeText               Quick Find                  Workflow Rules
#     VerifyText             Workflow Rules
#     ClickText              Workflow Rules
#     VerifyText             All Workflow Rules
#     VerifyText             Deactivate                  anchor=Mark Early Job Completion as Failed
#     ClickText              Deactivate                  anchor=Mark Early Job Completion as Failed
#     VerifyText             Activate                    anchor=Mark Early Job Completion as Failed
#     ClickText              Activate                    anchor=Mark Early Job Completion as Failed

# Activate/Deactivate Process Builder
#     [Tags]                 Deployment Automation
#     Home
#     GoTo                   ${login_url}lightning/setup/SetupOneHome/home
#     TypeText               Quick Find                  Process Builder
#     VerifyText             Process Builder
#     ClickText              Process Builder
#     VerifyText             My Processes
#     ${success}=    Set Variable    ${FALSE}
#     FOR    ${i}    IN RANGE    3
#         ClickText    Show all versions    anchor=User Story Commit outdates latest Validation
#         ${is_expanded}=                   IsText       Version 1: User Story Commit outdates latest
#         Exit For Loop If    ${is_expanded}
#         Sleep    3
#     END
#     Run Keyword If    not ${is_expanded}    Fail    Failed to expand "Show all versions" after 3 attempts
#     VerifyText             Deactivate                  anchor=Version 1: User Story Commit outdates latest
#     ClickText              Deactivate                  anchor=Version 1: User Story Commit outdates latest
#     VerifyText             Are you sure you want to deactivate this version?
#     ClickText              Confirm
#     ${success}=    Set Variable    ${FALSE}
#     FOR    ${i}    IN RANGE    3
#         ClickText    Show all versions    anchor=User Story Commit outdates latest Validation
#         ${is_expanded}=                   IsText       Version 1: User Story Commit outdates latest
#         Exit For Loop If    ${is_expanded}
#         Sleep    3
#     END
#     VerifyText             Activate                    anchor=Version 1: User Story Commit outdates latest
#     ClickText              Activate                    anchor=Version 1: User Story Commit outdates latest
#     VerifyText             Activating this process automatically deactivates any other active version.
#     ClickText              Confirm

