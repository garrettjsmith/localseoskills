# brightlocal-tool — Ferramenta BrightLocal (citações, avaliações e relatórios)

## O que é a skill?
É uma skill de ferramenta. Ela ensina quando e como usar o BrightLocal, um serviço pago de SEO local (otimização para aparecer em buscas de empresas locais). O BrightLocal tem um servidor MCP oficial (a "ponte" que deixa o Claude usar o serviço). Com ele conectado, a skill vira sua principal fonte de dados sobre citações.

Citação é qualquer menção ao nome, endereço e telefone (NAP) da empresa em diretórios online, como Yelp ou Facebook.

## Para que serve?
- **Auditoria de citações:** mostra onde a empresa está listada, se os dados (NAP) batem e se há listagens duplicadas.
- **Construção de citações:** o BrightLocal envia a empresa aos diretórios por você. Leva de 2 a 4 semanas.
- **Monitoramento de avaliações** no Google, Yelp, Facebook e outras plataformas.
- **Auditoria do GBP** (Perfil da Empresa no Google): gera uma nota de saúde do perfil.
- **Relatórios para clientes**, que podem receber a marca da sua agência.

Ela também ensina a ler as notas. Acima de 90% de consistência é bom. Abaixo de 70% é grave. Ensina ainda a corrigir primeiro os agregadores de dados (Data Axle, Neustar/Localeze, Foursquare), pois eles alimentam centenas de diretórios.

Ela não serve para volume de busca (use Semrush ou Ahrefs), backlinks (Ahrefs), mapa de calor de posições (Local Falcon), SERP ao vivo (SerpAPI) nem auditoria técnica de site (Screaming Frog).

## Como utilizar?
**Pré-requisitos:**
- Conta paga no BrightLocal, com o servidor MCP conectado.
- NAP exato da empresa, igual ao do GBP.
- Para construir citações: categorias, descrição, fotos e diretórios desejados (ou deixe o BrightLocal sugerir).

**Frases que acionam a skill:**
- "Faça uma auditoria de citações da minha empresa."
- "Onde estou listado? Meu NAP está consistente?"
- "Monitore minhas avaliações e gere um relatório para o cliente."

Nota: para só puxar dados, a skill prefere o LocalSEOData (`localseodata-tool`). O BrightLocal fica para construir citações e para painéis de monitoramento.

## O que ela produz?
Orientação para obter e interpretar: lista de citações, nota de precisão do NAP, lacunas e duplicatas, resumo de avaliações e nota do GBP. Indica o próximo passo, e a limpeza leva de 4 a 8 semanas.

**Skills relacionadas:**
- `local-citations`: corrigir ou construir citações.
- `review-management`: estratégia de avaliações.
- `gbp-optimization`: otimizar o perfil.
- `geogrid-analysis` e `local-seo-audit`: quando as citações estão limpas e ainda não ranqueia.
- `client-deliverables`: montar o relatório ao cliente.
