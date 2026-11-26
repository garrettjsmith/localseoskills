# lsa-spy-tool — Espião de Anúncios de Serviços Locais (LSA Spy)

## O que é a skill?

É uma skill de ferramenta. Ela ensina o Claude quando e como usar o LSA Spy, um serviço que acompanha os rankings dos LSA (Local Services Ads, ou Anúncios de Serviços Locais do Google).

Os LSA são anúncios pagos por lead (contato), não por clique. Aparecem no topo do Google, com o selo "Google Guaranteed" (Garantido pelo Google) ou "Google Screened" (Verificado pelo Google).

O Claude acessa o LSA Spy direto, via MCP (conexão entre o Claude e ferramentas externas).

## Para que serve?

- Ver quem aparece hoje nos LSA de uma cidade e categoria.
- Ver todos os concorrentes de um mercado, com posição média e frequência.
- Acompanhar quem subiu, desceu, entrou ou sumiu (7 ou 30 dias).
- Achar um negócio específico nos resultados.
- Avaliar se vale entrar em um mercado de LSA.

Não serve para ranking no mapa ou orgânico (use o Local Falcon) nem para volume de busca (use Semrush ou Ahrefs).

## Como utilizar?

**Pré-requisitos:** o LSA Spy conectado ao Claude via MCP. O texto não cita chave de API nem conta paga. Você informa o mercado (categoria e cidade) e, se quiser, o nome do negócio.

**Frases que acionam a skill:**
- "Quem está ranqueando nos LSA de encanador em Austin?"
- "Mostre os concorrentes de Google Guaranteed nesse mercado."
- "Quais mudanças de ranking nos LSA nos últimos 30 dias?"

**Passos:** o Claude acha o mercado, busca os rankings, os negócios ou as mudanças e interpreta os dados. Os fatores dos LSA são: avaliações, rapidez de resposta, proximidade, horário, orçamento e selo ativo.

**Skills relacionadas:**
- `lsa-ads`: estratégia e configuração dos anúncios.
- `review-management`: gerar mais avaliações.
- `local-reporting`: incluir os dados em relatórios.
- `local-falcon-tool`: comparar com a visibilidade orgânica.

## O que ela produz?

Uma análise em texto do mercado: quem lidera, quem subiu ou caiu, número de concorrentes e sinais de problema (como selo perdido). Ela sempre compara com as avaliações do seu negócio e sugere o próximo passo.
