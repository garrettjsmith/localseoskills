# local-falcon-tool — Ferramenta Local Falcon (mapa de rankings)

## O que é a skill?

É uma skill de **ferramenta**. Ela ensina a IA quando e como usar o Local Falcon, um serviço pago que mede em que posição um negócio aparece no Google Maps, em vários pontos de uma região.

## Para que serve?

- Rodar um **geogrid** (grade de pontos no mapa, usada para ver o ranking em cada ponto) e gerar um mapa de calor.
- Ver relatórios de scans já feitos.
- Acompanhar a evolução dos rankings ao longo do tempo (relatórios de tendência).
- Criar campanhas de scans recorrentes.
- Comparar o negócio com concorrentes.
- Vigiar o GBP (Perfil da Empresa no Google) contra edições indevidas, com o Falcon Guard.
- Analisar avaliações, com sentimento e comparação.
- Rodar scans em plataformas de IA (ChatGPT, Gemini, Grok e outras).

Principais métricas:
- **ARP**: posição média nos pontos da grade (menor é melhor).
- **ATRP**: média das melhores posições.
- **SoLV**: percentual de pontos em que o negócio aparece.

Não serve para volume de busca, backlinks (links de outros sites para o seu), tráfego do site ou auditoria técnica.

## Como utilizar?

**Pré-requisitos:**
- Conta no Local Falcon, ferramenta paga que cobra por créditos. A IA precisa ter acesso conectado (MCP).
- Nome ou endereço do negócio.
- Palavra-chave (o que o cliente pesquisa).
- Tamanho da grade, raio e plataforma. A skill sugere valores conforme o tipo de negócio.

Antes de rodar, a skill confere os relatórios existentes e o saldo de créditos, para não gastar à toa.

**Exemplos de frases:**
- "Rode um scan para a palavra-chave 'dentista' na minha clínica."
- "Como estou ranqueado no Maps?"
- "Alguém editou meu perfil no Google?"

**Skills relacionadas:**
- `geogrid-analysis`: interpretar os resultados (a skill nunca entrega números crus).
- `local-competitor-analysis`: analisar concorrentes.
- `gbp-optimization`: corrigir alterações no perfil.
- `review-management`: montar estratégia de avaliações.

Para scans rápidos e únicos, a skill `localseodata-tool` também serve.

## O que ela produz?

Relatórios do Local Falcon: mapa de calor, ARP, ATRP e SoLV, tendências, comparação com concorrentes, histórico de mudanças no perfil e análise de avaliações. Depois, a IA interpreta tudo com a `geogrid-analysis`.
