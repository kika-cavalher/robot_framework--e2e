#robot -d ./Front/logs ./Front/tests/default/online.robot

*Settings*
Documentation                   Suite to check if app is online

Library                         Browser
Resource                        ./keywords.robot
Test Setup                      Start Session
Test Teardown                   End Session


*Test Cases*
Must be online
    Get Title                   equal                                       Yodapp | QAninja


Must be show welcome text
    Wait For Elements State     
    ...                         css=.navbar-item >> text=Que a Força (qualidade) esteja com você!
    ...                         visible                                     5
