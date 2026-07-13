# Relatório de Bugs (Bug Reports) - DIO

Este documento simula a documentação profissional de falhas encontradas durante os ciclos de testes (manuais ou automatizados) no ambiente do cliente.

---

## BUG-001: Loop Infinito de Carregamento (Infinite Loading) na Tela de Perfil devido a Erro de Caminho Relativo

**Feature:** Perfil do Usuário - Conquistas (web.dio.me/users/realleotavares?tab=achievements)  
**Ambiente:** Chrome 150 (Desktop) / Windows 11  
**Severidade:** Crítica  
**Prioridade:** Alta  
**Status:** Aberto  

### Descrição
Ao acessar diretamente a URL do perfil público de um usuário (ou recarregar a página com F5), a tela principal (React/SPA) entra em um estado de carregamento infinito. O problema é causado por um caminho relativo mal configurado (`assets/utils.js` em vez de `/assets/utils.js`) na importação de scripts essenciais da aplicação, gerando um erro 404 (Not Found) na tentativa de carregamento (`/users/assets/utils.js`) e impedindo a hidratação e montagem dos componentes React.

### Passos para Reproduzir
1. Acessar a página `https://web.dio.me/users/realleotavares?tab=achievements` diretamente pela barra de endereços do navegador (ou atualizar a página via F5 caso já esteja nela).
2. Observar o estado da tela (indicador visual).

### Resultado Atual
A tela fica com o indicador de carregamento girando infinitamente e a página nunca é renderizada. No console de rede, é possível observar falhas de carregamento (HTTP 404) para recursos essenciais, como `https://web.dio.me/users/assets/utils.js` e `https://web.dio.me/locales/pt/translation.json`, causando uma interrupção silenciosa da inicialização do React (Resource Load Error).

### Resultado Esperado
O sistema deveria carregar corretamente a árvore de componentes independentemente do nível da rota (URL) acessada. Os caminhos dos *assets* estáticos no documento HTML devem ser configurados como caminhos absolutos a partir da raiz (ex: `src="/assets/utils.js"`) para que o navegador não os resolva como filhos da rota atual (`/users/...`).

### Evidências
- **Arquivo de Sessão:** `buglog-session_mrjq5eyf.mbs`
- **Log do Console:** `[Resource Error] Failed to load SCRIPT from https://web.dio.me/users/assets/utils.js`
- **Requisições de Rede:** Erro 404 capturado pelo BugLog / DevTools.

---
*Nota: Este é um documento fictício, elaborado para fins de portfólio, demonstrando organização e clareza na comunicação de falhas entre as equipes de QA e Desenvolvimento.*
