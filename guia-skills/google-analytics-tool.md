# google-analytics-tool — Análise de Tráfego e Conversões do Site (Google Analytics)

## O que é a skill?
É um guia que ensina a IA a usar o Google Analytics 4 (GA4). O GA4 é a ferramenta gratuita do Google que mostra o que as pessoas fazem no seu site. Ele responde: "o que acontece DEPOIS que alguém encontra você?".

## Para que serve?
Para analisar o desempenho do site de um negócio local. Ela ajuda a:
- ver o tráfego das páginas de cada unidade;
- medir conversões (ligações, formulários, pedidos de rota, agendamentos, chat);
- saber de onde vêm as visitas (busca orgânica, direto, indicação, anúncios, redes sociais);
- medir o tráfego vindo do GBP (Perfil da Empresa no Google), usando UTM (códigos no link que identificam a origem da visita);
- ver de quais cidades vêm os visitantes.

Limite importante: o GA4 só enxerga o site. Ele não mostra ligações, rotas e visualizações feitas dentro do GBP, nem rankings no mapa. Também não mostra rankings, backlinks (links de outros sites para o seu) ou o que as pessoas pesquisaram.

## Como utilizar?
**Pré-requisitos:**
- Conta do Google Analytics 4 com o site já conectado.
- O servidor MCP oficial do Google para o GA4 conectado (MCP é a ponte que deixa a IA acessar a ferramenta).
- Conversões configuradas no GA4. Ele não as rastreia sozinho. Sem isso, só dá para falar de tráfego, não de leads (contatos interessados). A skill avisa e recomenda configurar isso primeiro.
- Para medir o GBP: UTM no link do site dentro do perfil. Se não houver, ela recomenda adicionar.

**Exemplos de frases:**
- "Quantos leads meu site está gerando?"
- "De onde vem o meu tráfego?"
- "Meu site está convertendo?"

## O que ela produz?
Uma análise com interpretação, não só números: métricas como sessões (visitas), taxa de engajamento e taxa de conversão, comparação entre páginas e fontes, e o que fazer a seguir.

Ela indica estas skills relacionadas:
- `google-search-console-tool`: checar indexação e buscas.
- `local-keyword-research`: escolher palavras-chave.
- `local-landing-pages`: melhorar páginas e botões de contato.
- `gbp-optimization`: colocar UTM no perfil.
- `service-area-seo`: criar páginas para cidades sem tráfego.
- `local-reporting`: montar relatórios para clientes.
