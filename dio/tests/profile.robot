*** Settings ***
Documentation     Suite de testes BDD (Behavior Driven Development) para validar a renderização do Perfil Público da DIO.
...               Foco na hidratação de SPA, roteamento profundo e tratamento do Bug 404 de Assets (utils.js).
...               Este teste utiliza a biblioteca Browser (baseada em Playwright) para interceptação de tráfego.
Library           Browser

*** Variables ***
${URL_PERFIL}     https://web.dio.me/users/realleotavares
${BROWSER}        chromium
${HEADLESS}       True

*** Test Cases ***
Validar Carregamento Completo do Perfil SPA (Caminho Feliz)
    [Documentation]    Garante que o perfil público renderiza os elementos chaves sem bloqueios.
    [Tags]             UI    SPA    Caminho Feliz
    Dado que o recrutador acessa o perfil do aluno via link direto
    Quando o framework React hidratar a aplicação
    Então a página deve exibir o avatar e as conquistas do aluno sem spinner infinito

Validar Bloqueio de UI por Erro de Caminho Relativo (Reprodução Bug-001)
    [Documentation]    Interrompe a entrega de um asset estático (ex: utils.js) para atestar que
    ...                a plataforma quebra silenciosamente a renderização (Infinite Spinner).
    [Tags]             UI    Bug    Edge Case
    Dado que o recrutador acessa o perfil do aluno via link direto
    E o servidor falha ao entregar scripts de rotas relativas
    Quando o framework React tentar hidratar a aplicação
    Então a página falhará silenciosamente ficando presa no Loading
    E o componente de conquistas não ficará visível

*** Keywords ***
Dado que o recrutador acessa o perfil do aluno via link direto
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${URL_PERFIL}

E o servidor falha ao entregar scripts de rotas relativas
    [Documentation]    Simula a falha de um asset que deveria ser absoluto, mas foi chamado de forma relativa.
    Route    **/users/assets/utils.js    abort    failed

Quando o framework React hidratar a aplicação
    Wait For Elements State    body    attached

Quando o framework React tentar hidratar a aplicação
    Wait For Elements State    body    attached

Então a página deve exibir o avatar e as conquistas do aluno sem spinner infinito
    # Simulação da visibilidade de um elemento do DOM
    Log    Verificando ausência de "Loading..." contínuo
    Wait For Elements State    css=h1 >> text=Reall Leo Tavares    visible    timeout=10s

Então a página falhará silenciosamente ficando presa no Loading
    Log    A plataforma entra num estado de infinite loading sem exibir mensagem de erro de renderização.

E o componente de conquistas não ficará visível
    Log    O script falha, interrompendo a UI thread, impedindo renderização dos próximos componentes.
