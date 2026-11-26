# localseodata-tool — Central de Dados de SEO Local

## O que é a skill?
É a skill de ferramenta que conecta o Claude ao LocalSEOData, um serviço de dados. O Claude acessa o serviço direto, pelo servidor MCP (a ponte que liga o Claude a ferramentas externas).

É a fonte de dados padrão do repositório. O Claude consulta ela primeiro, antes de qualquer outra ferramenta.

## Para que serve?
Para puxar dados de SEO local (otimização para aparecer em buscas locais) sem sair da conversa. Exemplos:
- Ranking no pacote local (os 3 negócios em destaque no mapa do Google) e resultados de busca.
- Dados do GBP (Perfil da Empresa no Google).
- Avaliações, reputação e consistência de citações (NAP: nome, endereço e telefone em diretórios).
- Auditoria completa de SEO local.
- Mapa de calor de ranking por região (geogrid).
- Palavras-chave, concorrentes e backlinks (links de outros sites para o seu).
- Visibilidade em IA (Google AI Overview, ChatGPT etc.).

Ela também diz quando usar outra ferramenta: Local Falcon (monitoramento contínuo), Ahrefs (backlinks profundos), Screaming Frog (rastreio do site inteiro), Google Analytics (tráfego), Search Console (cliques e impressões) e LSA Spy (anúncios de serviços locais ao longo do tempo).

## Como utilizar?
Pré-requisitos:
- O servidor MCP conectado: `https://mcp.localseodata.com/mcp`.
- Créditos no LocalSEOData. Cada consulta tem custo. Uma checagem de ranking custa 1 crédito, uma auditoria completa custa 50 e uma avaliação de novo cliente soma cerca de 122.
- Dados do negócio: nome e cidade. Para auditar citações, também endereço completo e telefone. Para auditar uma página, a URL.

Exemplos de frases:
- "Rode uma auditoria de SEO local da Ace Plumbing em Buffalo, NY."
- "Verifique meus rankings."
- "Faça um geogrid scan para 'plumber near me'."

Dica: a skill indica o formato de local de cada ferramenta e sugere o fluxo mais barato.

Skills relacionadas: `geogrid-analysis` (interpretar o mapa de calor).

## O que ela produz?
Dados e relatórios de SEO local, conforme a consulta:
- posição no ranking;
- perfil do negócio;
- pontuação de consistência de citações;
- tendência de avaliações;
- pontuação de autoridade local (0 a 100);
- ideias de palavras-chave;
- lacunas frente aos concorrentes;
- mapa de ranking por região.
