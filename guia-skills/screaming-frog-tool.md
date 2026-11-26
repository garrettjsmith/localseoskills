# screaming-frog-tool — Rastreador técnico de sites (Screaming Frog)

## O que é a skill?
É uma skill de ferramenta. Ela ensina quando e como usar o Screaming Frog. Esse programa de computador "rastreia" um site, ou seja, visita todas as páginas, como o Google faz, e anota os problemas técnicos de cada uma. A skill é a principal ferramenta de auditoria técnica de SEO (otimização para buscadores).

## Para que serve?
- Fazer uma auditoria técnica completa do site.
- Checar páginas de unidades (uma por cidade ou loja): títulos, descrições, texto muito curto, erros e redirecionamentos.
- Achar conteúdo duplicado, links quebrados e páginas "órfãs" (quase sem links internos apontando para elas).
- Validar schema (código que descreve a empresa para o Google) e conferir NAP (nome, endereço e telefone) em muitas páginas.
- Detectar páginas bloqueadas ou fora do mapa do site.

Ela não serve para posição no Google, backlinks (links vindos de outros sites), tráfego ou citações. Para isso, use outras ferramentas.

## Como utilizar?
**Pré-requisitos:**
- O programa Screaming Frog instalado no seu computador. A skill não informa se ele é pago.
- Um rastreamento (crawl) rodado por você. Com MCP (conexão que deixa a IA controlar a ferramenta) ligado, a IA pode iniciar o rastreio e ler os resultados.
- Sem MCP, o caso mais comum, você exporta os dados e envia o arquivo na conversa:
  1. Rode o rastreio.
  2. Exporte Internal > All (CSV).
  3. Se precisar, use Bulk Export para relatórios específicos.
  4. Envie o CSV na conversa.
- Para checar schema e NAP, a skill orienta configurar a "extração personalizada" (Custom Extraction).
- Não pede chaves de API.

**Frases que acionam a skill:**
- "Faça uma auditoria técnica do meu site com Screaming Frog."
- "Analise este CSV do rastreio: tem conteúdo duplicado nas páginas de unidades?"
- "Quais links quebrados e redirecionamentos eu tenho?"

**Skills relacionadas que ela indica:**
- `local-landing-pages`: reescrever conteúdo e títulos, e corrigir links internos.
- `local-schema`: implementar schema.
- `local-seo-audit`: problemas de indexação.
- `gbp-optimization` e `local-citations`: corrigir NAP (GBP = Perfil da Empresa no Google).
- `client-deliverables`: montar o relatório para o cliente.

## O que ela produz?
Uma análise dos dados do rastreio, com problemas priorizados nesta ordem: bloqueios de indexação, conteúdo, estrutura e otimizações. Ela indica o que está errado e qual skill usar para corrigir.
