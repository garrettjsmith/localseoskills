# local-schema — Dados Estruturados para Negócio Local

## O que é a skill?

É uma skill de estratégia. Ela diz o que fazer para colocar "dados estruturados" no site de um negócio local.

Dados estruturados são um código escondido na página. Ele conta ao Google, em linguagem de máquina, quem é a empresa: nome, endereço, telefone, horários e área de atendimento. O formato usado é o JSON-LD (um bloco de texto com esses dados). O tipo de código é o "LocalBusiness" (negócio local).

## Para que serve?

- Fazer o site confirmar, com exatidão, o que o GBP (Perfil da Empresa no Google) diz.
- Escolher o tipo mais específico (ex.: Plumber para encanador, Dentist para dentista).
- Tratar empresa com várias unidades: cada uma recebe seu próprio código, com um identificador (@id) único.
- Tratar SAB (negócio que atende no local do cliente, sem endereço público): omite-se o endereço e destaca-se a área atendida.
- Validar e achar erros comuns: endereço diferente do GBP, telefone sem código do país, horários errados, @id repetido.

A skill avisa: schema sozinho raramente muda o ranking. Ele reforça outros sinais.

## Como utilizar?

Não exige conta, ferramenta paga nem chave de API. Para validar, use os testes gratuitos do Google (Rich Results Test) e o Schema Markup Validator.

Tenha em mãos: nome, endereço, telefone e horários; uma ou várias unidades; endereço público ou SAB; sistema do site (ex.: WordPress); se já existe schema; categorias do GBP.

Exemplos de frases:
- "Crie o schema LocalBusiness para o meu site."
- "Preciso de JSON-LD para uma empresa com três unidades."
- "Meu schema está certo? Valide."

Cuidado: ferramentas simples de leitura de página escondem esse código. Verifique com o Rich Results Test ou com o navegador.

## O que ela produz?

- Código JSON-LD pronto, para uma unidade, várias unidades ou SAB.
- Lista de erros encontrados na validação.
- Próximo passo padrão: validar no Rich Results Test e acompanhar erros no Search Console por 2 semanas.

Skills relacionadas:
- `gbp-optimization`: conferir se o GBP bate com o schema.
- `local-landing-pages`: schema em várias páginas de unidades.
- `local-seo-audit`: levar os achados para a auditoria completa.
- `geogrid-analysis`: se o ranking não mudou.
