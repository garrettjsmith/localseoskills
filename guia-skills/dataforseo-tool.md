# dataforseo-tool — Dados em Massa com a DataForSEO

## O que é a skill?
É um guia que ensina a usar a DataForSEO, um serviço pago que fornece dados de buscas do Google em grande volume. O acesso é feito por um servidor MCP (conexão que liga a IA ao serviço).

Ela também diz quando NÃO usar a DataForSEO. Para a maioria dos casos, a skill `localseodata-tool` é a opção padrão, porque é mais simples e usa a DataForSEO por baixo.

## Para que serve?
Serve para trabalhos grandes ou sob medida:
- Volume de busca de centenas de palavras-chave de uma vez (volume, CPC e concorrência). CPC é o custo por clique nos anúncios do Google.
- Resultados de busca (SERP = página de resultados do Google) de muitas palavras e cidades, para ver quem aparece no pacote local (os 3 negócios do mapa).
- Dados de Perfil da Empresa no Google (GBP) e avaliações de concorrentes.
- Monitoramento de ranking próprio, em grade de pontos no mapa.

Não serve para uma consulta isolada, auditoria de citações (menções do negócio em sites) ou mapas visuais de ranking. Para esses casos, ela indica outras ferramentas.

## Como utilizar?
Pré-requisitos:
- Conta na DataForSEO, paga por tarefa. Valores de referência: busca ~US$ 0,002–0,005 por resultado; palavras-chave ~US$ 0,05 por lote; dados de empresa ~US$ 0,005 por resultado.
- Servidor MCP da DataForSEO conectado.
- Você informa: lista de palavras-chave, cidades ou locais e, se houver, os concorrentes.

A skill manda estimar o custo antes de rodar e usar endpoints assíncronos (envia as tarefas e busca os resultados depois) em lotes grandes.

Frases que acionam a skill:
- "Preciso do volume de 500 palavras-chave de uma vez."
- "Quero dados de busca em escala para 50 palavras em 10 cidades."
- "Use a DataForSEO para puxar dados do Google Maps."

## O que ela produz?
Dados brutos e estruturados, não relatórios prontos:
- volume, CPC, concorrência e tendência mensal;
- presença e participantes do pacote local, anúncios e resposta de IA;
- dados do GBP e avaliações dos concorrentes.

A skill pede que você combine esses dados com uma skill de análise:
- `local-keyword-research` (volumes)
- `gbp-optimization` (pacote local)
- `local-competitor-analysis` (GBP de concorrentes)
- `review-management` (avaliações)
- `geogrid-analysis` (ranking em grade)
