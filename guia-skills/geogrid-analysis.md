# geogrid-analysis — Análise de Mapa de Calor de Rankings Locais

## O que é a skill?

É uma skill de estratégia. Ela diz o que fazer para ler e interpretar um "geogrid" (grade geográfica).

O geogrid é um mapa dividido em pontos. Em cada ponto, uma busca é simulada no Google Maps. O resultado mostra em que posição sua empresa aparece em cada lugar da região.

## Para que serve?

- Entender onde sua empresa aparece bem e onde some nas buscas do Google Maps.
- Ler três métricas:
  - **ARP**: posição média nos pontos do mapa. Menor é melhor.
  - **ATRP**: média das três melhores posições. Mostra o melhor cenário.
  - **SoLV** (Share of Local Voice, "fatia da voz local"): porcentagem de pontos em que você aparece. Acima de 70% é forte.
- Achar padrões: forte perto da loja e fraco longe, fraco numa direção, resultados instáveis.
- Descobrir concorrentes que dominam certas zonas.
- Acompanhar a evolução ao longo do tempo.
- Explicar os números ao cliente em linguagem simples.

## Como utilizar?

**Pré-requisitos:**
- A ferramenta padrão é a Local SEO Data (`localseodata-tool`), que cobra créditos. Uma varredura custa de 50 a 162 créditos, conforme o tamanho da grade (5x5 = 50, 7x7 = 98, 9x9 = 162).
- Para relatórios de tendência, campanhas recorrentes e monitoramento Falcon Guard, use a Local Falcon (`local-falcon-tool`).
- Chaves de API: os arquivos lidos não citam nenhuma.

**Informe à skill:**
- A palavra-chave pesquisada.
- O tamanho da grade e o raio.
- A data da varredura.
- O endereço da empresa.
- As áreas prioritárias.
- Os concorrentes conhecidos.
- Varreduras antigas, se houver.

**Exemplos de frases:**
- "Analise o geogrid do meu cliente para 'encanador'."
- "Onde estou ranqueando no Google Maps?"
- "Explique meu ARP e meu SoLV."

## O que ela produz?

Um relatório de análise da varredura, com:
- Parâmetros (palavra-chave, grade, raio, data).
- Métricas ARP, ATRP e SoLV.
- Comparação com varreduras anteriores.
- Padrão geográfico identificado.
- Principais concorrentes nas zonas fracas.
- 3 a 5 ações prioritárias.

**Skills relacionadas que ela indica:**
- `gbp-optimization`: otimizar o Perfil da Empresa no Google (GBP).
- `local-landing-pages` e `local-citations`: páginas locais e citações (menções da empresa em diretórios).
- `local-competitor-analysis`: análise de concorrentes.
- `local-seo-audit`: auditoria completa de SEO local.
- `review-management`: gestão de avaliações.
