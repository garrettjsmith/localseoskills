# Padrão comum das timelines (lido por todos os subagentes)

## Arquivo
- Um arquivo HTML autocontido por caso: `guia-skills/timelines/caso-NN-<slug>.html` (NN com dois dígitos).
- Sem dependências externas: nada de CDN, fontes web ou imagens remotas. As ilustrações são SVG inline e emoji.
- Comece com `<meta charset="utf-8">`, `<title>`, `<meta name="viewport" content="width=device-width, initial-scale=1">`. Não use as tags `<html>`, `<head>` nem `<body>`.
- Todo o texto em português do Brasil, simples e claro para um leigo.

## Conteúdo
1. **Cabeçalho:** número e nome do caso, uma frase com a situação e uma com o objetivo, e chips com exemplos de negócio.
2. **Timeline ilustrada** com as fases nesta ordem:
   - Inclua outras fases **somente se o caso realmente precisar**, na posição certa (antes, entre ou depois das três obrigatórias). Exemplos: "0 · Diagnóstico inicial", "Estabilização", "Escala / expansão", "Manutenção contínua". Numere todas em sequência.
   - **Implementação**
   - **Acompanhamento e gestão dos resultados**
   - **Proposição de melhorias**
3. **Cada fase traz:**
   - ícone/ilustração SVG própria;
   - título e prazo típico (ex.: "Semanas 1–4");
   - objetivo em uma frase;
   - **as skills necessárias**, em cartões com o nome exato da skill em `código` (ex.: `gbp-optimization`), o que ela faz nessa fase (1 linha) e o selo de custo: ✅ grátis · 🪙 créditos · 💳 ferramenta paga · 🔑 precisa de conta/acesso;
   - entregáveis da fase;
   - indicadores a acompanhar (KPIs), quando fizer sentido;
   - um "⚠️ cuidado no Brasil" quando houver.
4. Uma **faixa de marcos** (checkpoints) ao longo da linha do tempo, por exemplo "perfil verificado", "20 avaliações", "1º relatório".
5. **Rodapé:** "Fases extras incluídas e por quê" (ou "Nenhuma fase extra necessária"), a legenda dos selos e um lembrete de que `brief` guarda o histórico e `dispatch` escolhe as skills.

## Visual (igual em todas)
- Estilo quadro-branco: fundo `#f6f8f7` com grade leve, cartões brancos com sombra suave, títulos em fonte "manuscrita" de sistema (`"Marker Felt","Chalkboard SE","Segoe Print","Bradley Hand",cursive`) e texto em `system-ui`.
- **Cores das fases** (use estas):
  - Diagnóstico/pré `#7a5af8`;
  - Implementação `#1f5da3`;
  - Acompanhamento `#2e7d3c`;
  - Melhorias `#c2410c`;
  - Fases extras de escala/manutenção `#0e7490`.
- Os selos de custo usam pílulas com cor de fundo suave.
- **Layout:**
  - Desktop (≥ 900px): linha do tempo horizontal, com uma linha grossa ligando círculos numerados e as fases em colunas abaixo. Se houver mais de 4 fases, a linha rola na horizontal ou quebra em duas linhas.
  - Celular: linha do tempo vertical, com a linha à esquerda.
- **Modo escuro** via `prefers-color-scheme: dark`, com contraste legível.
- Um link "← Todos os casos" no topo, apontando para `index.html`.

## Fontes de informação
- O caso: `guia-skills/casos-de-uso-brasil.md` (a seção do seu número).
- O que cada skill faz: `guia-skills/<skill>.md`. A spec completa fica em `skills/<skill>/SKILL.md` ou `tools/<skill>/SKILL.md` (use `find` se precisar).
- Use apenas skills que existem: há 39 arquivos `.md` em `guia-skills/`, sem contar este padrão nem os casos.
- Não use `lsa-ads` nem `lsa-spy-tool`, porque esse tipo de anúncio não roda no Brasil.
