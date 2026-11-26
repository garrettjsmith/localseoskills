# brief — Caderno de Acompanhamento do Cliente

## O que é a skill?

É a "memória" do trabalho de SEO local. SEO local é otimizar um negócio para aparecer nas buscas e no Google Maps da sua região.

A skill cria e mantém um "brief": um arquivo de acompanhamento, um por unidade (localização) do negócio. Para redes com várias unidades, há também um arquivo geral da marca, que resume todas elas.

## Para que serve?

- Guardar tudo o que já foi feito: varreduras, auditorias, relatórios e problemas encontrados.
- Retomar o trabalho sem recomeçar do zero.
- Registrar o próximo passo mais importante.
- Montar um histórico que cresce mês a mês. Dá para perguntar "por que o ranking caiu em março?" e achar a resposta.
- Receber os resultados de tarefas agendadas e anotar o essencial.

## Como utilizar?

Ela é acionada automaticamente quando você cita um negócio ou cliente. Exemplos:

- "Vou trabalhar na Encanamentos do Mike, em Buffalo."
- "Continue de onde paramos com a Keystone Insurance."
- "Retome o trabalho da unidade de Pittsburgh."

Se ainda não existir brief, ela faz cinco perguntas, uma por vez:

1. Qual é a palavra-chave principal (ex.: "plumber buffalo ny")?
2. Qual é o site?
3. Até onde vai a área de atendimento (ex.: 5 ou 20 milhas)?
4. É um cliente ou o seu próprio negócio? Se for cliente, qual o e-mail para relatórios?
5. Quer alertas e relatórios em um canal do Slack? (opcional)

Depois ela roda uma auditoria inicial sozinha, usando a ferramenta LocalSEOData (serviço de dados de SEO local, com créditos, que provavelmente precisa de conta). Em seguida oferece monitoramento automático, configurado pelo comando `/schedule`.

Sem acesso a arquivos (Claude Project, versão de navegador), ela entrega o brief em texto, para você colar na base de conhecimento do projeto.

## O que ela produz?

Uma pasta por marca e por unidade, com:

- `location.brief.md`: o brief enxuto e sempre atualizado (resumo da unidade, diário de sessões, achados e próxima ação).
- `_brand.brief.md`: configuração e resumo da marca.
- Subpastas: `reports/` (relatórios), `scans/` (varreduras), `drafts/` (rascunhos para aprovação) e `alerts/` (alertas).

Os briefs ficam fora do repositório (gitignored), para proteger dados de clientes. Os arquivos nunca são apagados.

Ela também sugere registrar em `meta/lessons.md` padrões novos que descobrir, mas só com a sua confirmação.

Relacionadas: `tasks/README.md` (tarefas agendadas) e `specs/output-schema.md` (formato dos arquivos de saída).
