# dispatch — Guia de Roteamento (qual skill usar)

## O que é a skill?
É um mapa de decisão. Ela não executa trabalho de SEO local. Ela diz quais outras skills carregar juntas, conforme o pedido.

SEO local é a otimização para aparecer em buscas locais, como "dentista perto de mim".

## Para que serve?
Evita carregar todas as skills de uma vez. Para cada tipo de pedido, ela indica só 2 ou 3 skills.

Ela também define a ferramenta de dados padrão: a `localseodata-tool`, que atende a maioria dos casos.

Não é preciso usá-la quando o pedido é de uma skill só. Exemplo: "como escrevo um post no Perfil da Empresa no Google?" vai direto para `gbp-posts`.

## Como utilizar?
Carregue-a primeiro, quando chegar um pedido de SEO local e você não souber qual skill ativar.

**Frases que acionam:**
- "Por que não apareço no mapa do Google?" (map pack = os 3 negócios em destaque no mapa)
- "Me ajude a conseguir mais avaliações."
- "Preciso de um relatório mensal."

**Pré-requisitos:**
- Nenhum para o roteamento em si.
- As skills indicadas usam a `localseodata-tool`. Ela precisa estar conectada e consome créditos pagos.
- Outras ferramentas só entram em casos específicos: Local Falcon (acompanhamento de rankings no mapa ao longo do tempo), Whitespark ou BrightLocal (criação de citações) e Ahrefs (análise profunda de links), se estiverem conectadas.
- Tenha em mãos o negócio e a cidade.

**Exemplos de rotas:**
- Auditoria: `local-seo-audit` + `localseodata-tool`.
- Perfil da Empresa no Google (GBP): `gbp-optimization`.
- Avaliações: `review-management`.
- Citações (menções de nome, endereço e telefone em outros sites) e NAP (esses três dados): `local-citations`.
- Concorrentes: `local-competitor-analysis`.
- Vários locais: `multi-location-seo`.
- Negócio que atende no endereço do cliente (SAB): `service-area-seo`.
- Anúncios de Serviços Locais (LSA): `lsa-ads` e `lsa-spy-tool`.
- Palavras-chave: `local-keyword-research`.
- Links: `local-link-building`.
- Dados estruturados (schema): `local-schema`.
- Busca por IA: `ai-local-search`.
- Perfil suspenso: `gbp-suspension-recovery`.
- Proposta ou relatório: `client-deliverables` e `local-reporting`.
- Google Ads: `local-search-ads` e `local-ppc-ads`.
- Apple Maps ou Bing: `apple-business-connect` e `bing-places`.

Se houver termo desconhecido, ela manda consultar `docs/local-seo-glossary`. Para ver o porquê das coisas, `docs/how-local-search-works`. Para escolher ferramenta, `docs/tool-routing`.

## O que ela produz?
Nenhum arquivo e nenhum relatório. Ela entrega uma lista curta de skills e ferramentas a carregar, na ordem certa para o pedido.
