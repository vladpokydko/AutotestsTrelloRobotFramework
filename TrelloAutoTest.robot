*** Settings ***
Library     SeleniumLibrary
Resource    Resources.robot
*** Test Cases ***
TrelloAuth
#Through Keywords from Resources.robot
    LaunchTrello
    Authorization

BoardCreate
    #Checking Page Title
    ${"title"}  set variable  Доски | Trello
    title should be     ${"title"}
    log to console      ${"title"}
    set selenium implicit wait  10 seconds
    #sleep   3
    click element   xpath://div[@class="board-tile mod-add"]
    #sleep   1
    click element   xpath://input[@class="subtle-input"]
    #sleep   1
    input text  xpath://input[@class="subtle-input"]    TestBoard
    #sleep   1
    click button    xpath://button[@class="subtle-chooser-trigger unstyled-button org-chooser-trigger"]
    #sleep   1
    click element  xpath://div[@class='pop-over mod-no-header is-shown']//ul[@class='pop-over-list org-chooser']/li[2]
    #sleep   1
    click button    xpath://div[@class='action-items']/button[@class='button primary']
    #sleep   3

    #Navigate to Main Page
    click element   xpath://a[@data-test-id='header-home-button']
    sleep   1

BoardNavigation
    ${"title"}  set variable  Доски | Trello
    title should be     ${"title"}
    log to console      ${"title"}
    click element   xpath://div[@title="Задачи для автоматизации"]
    sleep   1
    ${"boardTitle"}     set variable    Задачи для автоматизации | Trello
    title should be     ${"boardTitle"}
    log to console  ${"boardTitle"}
    sleep   1

CardCreate
    #create list
    click element   xpath://span[@class='placeholder']
    input text  xpath://input[@name='name']     Starting point column
    sleep   1
    click element   xpath://input[@type='submit']
    #create card
    click element   xpath://span[@class='js-add-a-card']
    sleep   1
    input text  xpath://textarea[@class='list-card-composer-textarea js-card-title']    Автоматизация Трелло
    click element   xpath://input[@class='primary confirm mod-compact js-add-card']
    sleep   1
    #create description
    click element   xpath://div[@class='list-card-details js-card-details']
    #sleep   3
    input text  xpath://textarea[@class='field field-autosave js-description-draft description card-description']   Оформим чек-листом
    click element   xpath://a[@class='button-link js-add-checklist-menu']
    input text  xpath://input[@id='id-checklist']   STR for Autotests
    #sleep   1
    click element   xpath://input[@class='primary wide confirm js-add-checklist']
    #create check-list
    input text  xpath://textarea[@placeholder='Добавить элемент']   Авторизация
    #sleep   1
    click element   xpath://input[@class='primary confirm mod-submit-edit js-add-checklist-item']
    input text  xpath://textarea[@placeholder='Добавить элемент']   Создание новой доски
    #sleep   1
    click element   xpath://input[@class='primary confirm mod-submit-edit js-add-checklist-item']
    input text  xpath://textarea[@placeholder='Добавить элемент']   Переход к доске
    #sleep   1
    click element   xpath://input[@class='primary confirm mod-submit-edit js-add-checklist-item']
    input text  xpath://textarea[@placeholder='Добавить элемент']   Создание новой карточки
    #sleep   1
    click element   xpath://input[@class='primary confirm mod-submit-edit js-add-checklist-item']
    input text  xpath://textarea[@placeholder='Добавить элемент']   Перенесение карточки в другую колонку
    #sleep   1
    click element   xpath://input[@class='primary confirm mod-submit-edit js-add-checklist-item']
    input text  xpath://textarea[@placeholder='Добавить элемент']   Архивация карточки
    #sleep   1
    click element   xpath://input[@class='primary confirm mod-submit-edit js-add-checklist-item']
    #sleep   2
    #mark finished steps
    click element   xpath://div[@class='checklist-item no-assignee no-due']/div[@class='checklist-item-checkbox enabled js-toggle-checklist-item']
    #sleep   2
    click element   xpath://div[@class='checklist-item no-assignee no-due']/div[@class='checklist-item-checkbox enabled js-toggle-checklist-item']
    #sleep   2
    click element   xpath://div[@class='checklist-item no-assignee no-due']/div[@class='checklist-item-checkbox enabled js-toggle-checklist-item']
    #sleep   2
    click element   xpath://div[@class='checklist-item no-assignee no-due']/div[@class='checklist-item-checkbox enabled js-toggle-checklist-item']
    #sleep   2
    #close card
    click element   xpath://a[@class='icon-md icon-close dialog-close-button js-close-window']

CardTransfer
    #create new column
    wait until element is visible   xpath://span[@class='placeholder']
    click element   xpath://span[@class='placeholder']
    input text  xpath://input[@class='list-name-input']     Finishing point column
    click element   xpath://input[@class='primary mod-list-add-button js-save-edit']
    #card moving
    wait until element is visible   xpath://a[@class='list-card js-member-droppable ui-droppable']
    open context menu   xpath://div[@class='list-card-details js-card-details']
    click link      xpath://a[@class='quick-card-editor-buttons-item js-move-card']
    click element      xpath://select[@class='js-select-list']
    click element   xpath://option[contains(text(), 'Finishing point column')]
    click element   xpath://input[@class='primary wide js-submit']

    #Finishing Step5
    click element   xpath://a[@class='list-card js-member-droppable ui-droppable']
    click element   xpath://div[@class='checklist-item no-assignee no-due']/div[@class='checklist-item-checkbox enabled js-toggle-checklist-item']
    click element   xpath://a[@class='icon-md icon-close dialog-close-button js-close-window']


CardArchive
    #sleep   3
    open context menu   xpath://div[@class='list-card-details js-card-details']
    click element   xpath://a[@class='quick-card-editor-buttons-item js-archive']
    #sleep   3
    close browser

#Написать Suite Teardown, вычищающий созданные таблицы и колонки в "базовой" таблице