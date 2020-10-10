*** Variables ***
${url}  https://trello.com/
${TrelloLogin}  surfingtheweb173@gmail.com
${TrelloPassword}  Test12341234

*** Keywords ***
LaunchTrello
    open browser    ${url}  chrome
    maximize browser window
Authorization
    click link  xpath://a[contains(text(),'Войти')]
    sleep   1
    title should be     Вход в Trello
    ${"login"}  set variable    id:user
    SeleniumLibrary.Element Should Be Visible  ${"login"}
    SeleniumLibrary.Element Should Be Enabled  ${"login"}
    input text  ${"login"}      ${TrelloLogin}
    input text  id:password     ${TrelloPassword}
    sleep   2
    click element   xpath://*[@id="login"]
    sleep   3