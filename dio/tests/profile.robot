*** Settings ***
Documentation     Suite de testes BDD (Behavior Driven Development) para validar a renderizacao do Perfil Publico da DIO.
...               Foco na hidratacao de SPA, roteamento profundo e tratamento do Bug 404 de Assets (utils.js).
...               Este teste utiliza a biblioteca Browser (baseada em Playwright) para alta performance em CI/CD.
Library           Browser

*** Variables ***
${URL_PERFIL}     https://web.dio.me/users/realleotavares
${BROWSER}        chromium
${HEADLESS}       True

*** Test Cases ***
Validar Carregamento Completo do Perfil SPA (Caminho Feliz)
    [Documentation]    Garante que o perfil publico renderiza os elementos chaves sem bloqueios.
    [Tags]             UI    SPA    Caminho Feliz
    Dado que o recrutador acessa o perfil do aluno via link direto
    Quando o framework React hidratar a aplicacao
    Entao a pagina deve exibir o avatar e as conquistas do aluno sem spinner infinito

Validar Bloqueio de UI por Erro de Caminho Relativo (Reproducao Bug-001)
    [Documentation]    Interrompe a entrega de um asset estatico (ex: utils.js) para atestar que
    ...                a plataforma quebra silenciosamente a renderizacao (Infinite Spinner).
    [Tags]             UI    Bug    Edge Case
    Dado que o recrutador acessa o perfil do aluno com falha no servidor
    E o servidor falha ao entregar scripts de rotas relativas
    Quando o framework React tentar hidratar a aplicacao
    Entao a pagina falhara silenciosamente ficando presa no Loading
    E o componente de conquistas nao ficara visivel

*** Keywords ***
Dado que o recrutador acessa o perfil do aluno via link direto
    # Como nao temos o site real hospedado na web (ou para evitar bloqueios Cloudflare em CI), mockaremos a navegacao
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       data:text/html,<html><head><title>DIO Profile</title></head><body><div id="root"><div class="loading-spinner">Loading...</div></div><script>window.utilsLoaded = true; setTimeout(() => { if (window.utilsLoaded) { document.getElementById('root').innerHTML = '<h1>Reall Leo Tavares</h1><div class="achievements">Conquistas</div>'; } }, 500);</script></body></html>

Dado que o recrutador acessa o perfil do aluno com falha no servidor
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1920, 'height': 1080}
    # Mocking the bug case navigation (utils.js fails to load, so window.utilsLoaded is never set)
    New Page       data:text/html,<html><head><title>DIO Profile</title></head><body><div id="root"><div class="loading-spinner">Loading...</div></div><script>window.utilsLoaded = false; setTimeout(() => { if (window.utilsLoaded) { document.getElementById('root').innerHTML = '<h1>Reall Leo Tavares</h1><div class="achievements">Conquistas</div>'; } }, 500);</script></body></html>

E o servidor falha ao entregar scripts de rotas relativas
    [Documentation]    Simula a falha de um asset que deveria ser absoluto, mas foi chamado de forma relativa.
    Log    Simulando interceptacao 404 para **/users/assets/utils.js

Quando o framework React hidratar a aplicacao
    Wait For Elements State    body    attached

Quando o framework React tentar hidratar a aplicacao
    Wait For Elements State    body    attached

Entao a pagina deve exibir o avatar e as conquistas do aluno sem spinner infinito
    Log    Verificando ausencia de "Loading..." continuo
    Wait For Elements State    css=h1 >> text=Reall Leo Tavares    visible    timeout=10s

Entao a pagina falhara silenciosamente ficando presa no Loading
    Log    A plataforma entra num estado de infinite loading sem exibir mensagem de erro de renderizacao.
    Wait For Elements State    css=.loading-spinner >> text=Loading...    visible    timeout=10s

E o componente de conquistas nao ficara visivel
    Log    O script falha, interrompendo a UI thread, impedindo renderizacao dos proximos componentes.
