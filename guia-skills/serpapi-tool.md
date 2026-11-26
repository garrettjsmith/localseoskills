# serpapi-tool — Consulta ao vivo da página de resultados do Google

## O que é a skill?

É uma skill de **ferramenta**. Ela ensina quando e como usar o SerpAPI, um serviço que mostra os resultados de busca em tempo real.

Funciona com o Google, o Bing e outros buscadores, em qualquer cidade.

A conexão é feita por MCP (um "plugin" que liga a IA a serviços externos). O registro de ferramentas do projeto indica que o SerpAPI já vem conectado.

## Para que serve?

Serve para tirar uma "foto" rápida de uma busca. Ela mostra:

- **Pacote local (local pack):** os 3 negócios do mapa que aparecem no topo.
- **Resultados orgânicos:** a lista de sites sem anúncio.
- **Anúncios:** indicam que a palavra-chave tem valor comercial.
- **PAA (People Also Ask, "As pessoas também perguntam"):** perguntas que viram ideias de conteúdo.
- **AI Overview:** o resumo gerado por IA no topo do Google.
- **SERP (página de resultados de busca):** o conjunto de tudo isso.

Ela **não** serve para ranking em vários pontos do mapa, volume de busca ou histórico. Para isso, use outras ferramentas.

Aviso: o LocalSEOData é o padrão para dados ao vivo do Google. O SerpAPI é a reserva, quando o LocalSEOData não está conectado, ou para Bing e Yahoo.

## Como utilizar?

**Pré-requisito:** o SerpAPI conectado via MCP. O texto não detalha conta nem chave de API.

**Você informa:** a palavra-chave (ex.: "encanador de emergência") e o local (ex.: Buffalo, New York).

**Frases que acionam a skill:**
- "Quem aparece no mapa para dentista em Orchard Park?"
- "Veja como está a página de resultados para 'encanador de emergência'."
- "Pesquise [palavra-chave] e me diga se há AI Overview."

A skill escolhe o mecanismo de busca: Google, Google Maps, busca local, versão leve, notícias, imagens ou Bing.

## O que ela produz?

Uma análise rápida da concorrência naquela busca: se há anúncios, mapa, AI Overview e perguntas do PAA, quantas avaliações os negócios do mapa têm e quem ocupa o topo orgânico.

Depois indica o próximo passo:

- Concorrentes com mais avaliações: `review-management`
- Sem mapa na busca: `local-keyword-research`
- AI Overview sem citar você: `ai-local-search`
- Perguntas do PAA: `local-landing-pages`
- Anúncios presentes: `local-ppc-ads`
- Ranking geográfico: `local-falcon-tool`
- Posição errada no mapa: `geogrid-analysis`

É só uma foto do momento. Para acompanhar ao longo do tempo, use o Local Falcon.
