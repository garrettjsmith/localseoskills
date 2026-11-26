# google-search-console-tool — Guia do Google Search Console

## O que é a skill?

É uma skill de ferramenta. Ela ensina quando e como usar o Google Search Console (GSC), a ferramenta gratuita do Google que mostra como seu site aparece na busca.

O GSC é a única fonte com dados reais do Google: cliques e impressões (vezes em que seu site apareceu nos resultados). Existem servidores MCP (conectores que ligam a IA a uma ferramenta) oficiais e da comunidade para ele.

## Para que serve?

- Ver quais buscas levam gente ao seu site e a quais páginas.
- Calcular o CTR (taxa de cliques: cliques ÷ impressões) e a posição média.
- Conferir se uma página está indexada (guardada no Google) e achar erros de indexação.
- Checar o Core Web Vitals (CWV), as métricas de velocidade e estabilidade da página, principalmente no celular.
- Achar buscas com muita demanda e sem página própria.

Limites importantes:
- Mostra só resultados orgânicos (sem anúncios). Cliques do mapa (map pack) não aparecem.
- Não traz volume de busca, dados de concorrentes nem backlinks (links de outros sites para o seu).

## Como utilizar?

Pré-requisitos: acesso ao GSC do site e o conector MCP ligado. A skill não cita outras contas, ferramentas pagas ou chaves de API.

Exemplos de frases:
- "Para quais palavras-chave meu site recebe tráfego?"
- "Minha página está indexada?"
- "Qual é o CTR das minhas páginas de cidades?"

Depois, a skill indica outras skills:
- `local-landing-pages`: reescrever títulos e criar páginas novas.
- `local-seo-audit` e `screaming-frog-tool`: corrigir problemas técnicos.
- `local-falcon-tool`: ver o mapa.
- `semrush-tool`: analisar concorrentes.
- `local-reporting`: montar relatórios.

## O que ela produz?

Uma análise de dados reais do seu site, com interpretação. Por exemplo: CTR baixo para a posição indica título ou descrição fracos; página sem impressões pode não estar indexada.

Ela também sugere o próximo passo e a skill certa para executá-lo. O GSC é a base: comece por ele e complete com outras ferramentas.
