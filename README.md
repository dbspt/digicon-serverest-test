# digicon-serverest-test

Automação de testes web do [ServeRest](https://front.serverest.dev/) com **Robot Framework** e **SeleniumLibrary**, escrita em **BDD (Gherkin)** e organizada em camadas com **Page Objects**.

## Cenários automatizados

| Arquivo | O que cobre |
|---|---|
| `tests/web/cadastro.robot` | Cadastro de usuário (administrador e não administrador), em formato de tabela |
| `tests/web/login.robot` | Login com sucesso, com credenciais incorretas e sem senha |
| `tests/web/login_sem_sucesso.robot` | Quatro cenários de login sem sucesso, em formato de tabela (um deles usa Faker) |
| `tests/web/lista_de_compras.robot` | Fluxo completo em 3 testes: cadastrar administrador, fazer login e adicionar produto na lista de compras |

## Estrutura do projeto

```
.
├── resources/                  # Implementação
│   ├── configs/                # Configurações e variáveis globais (URL, navegador, credenciais)
│   ├── page_objects/           # Mapeamento dos elementos (locators) de cada página
│   ├── pages/                  # Ações executadas em cada página
│   └── steps/                  # Passos Gherkin (Dado / Quando / E / Então)
├── tests/                      # Cenários de teste escritos em Gherkin
│   ├── web/                    # Testes no navegador
│   └── api/                    # Reservada para testes de API
├── screenshots/                # Prints do último fluxo de lista de compras (gerada ao rodar)
├── results/                    # Relatórios do Robot (gerada ao rodar)
└── requirements.txt
```

Cada camada só conhece a de baixo:

1. **Cenário** (`tests/`): conta a história em Gherkin.
2. **Step** (`resources/steps`): liga cada frase a uma ação.
3. **Ação** (`resources/pages`): executa a operação na tela.
4. **Objeto** (`resources/page_objects`): diz onde está cada elemento.

Se um elemento mudar na tela, o ajuste é feito em um único lugar, no page object.

## Pré-requisitos

- Python 3.10 ou superior
- Google Chrome instalado (o Selenium baixa o driver sozinho)

## Instalação

```powershell
# 1. Clonar o repositório
git clone https://github.com/Ezequiel-Kellermann-1976/digicon-serverest-test.git
cd digicon-serverest-test

# 2. Criar e ativar o ambiente virtual
python -m venv .venv
.\.venv\Scripts\Activate.ps1

# 3. Instalar as dependências
pip install -r requirements.txt
```

## Como executar

Use sempre o Python do ambiente virtual, para garantir que a SeleniumLibrary seja encontrada.

```powershell
# Todos os testes web
python -m robot -d results/ tests/web/

# Um arquivo específico
python -m robot -d results/ tests/web/lista_de_compras.robot
```

Os relatórios (`log.html`, `report.html` e `output.xml`) são salvos em `results/`.

## Tags

Os testes usam tags para permitir execuções parciais:

| Tag | Onde | Significado |
|---|---|---|
| `e2e` | `lista_de_compras.robot` | Fluxo completo de ponta a ponta |
| `admin` | `lista_de_compras.robot` | Usuário administrador |
| `cadastro` | `lista_de_compras.robot` | Etapa de cadastro |
| `login` | `lista_de_compras.robot` | Etapa de login |
| `lista-de-compras` | `lista_de_compras.robot` | Etapa de adicionar produto |
| `sucesso` | `login.robot` | Login com sucesso |
| `negativo` | `login.robot` | Login recusado |
| `obrigatorios` | `login.robot` | Validação de campos obrigatórios |

```powershell
# Rodar só o fluxo completo
python -m robot -d results/ --include e2e tests/web/

# Rodar só os cenários negativos de login
python -m robot -d results/ --include negativo tests/web/
```

> **Atenção:** os 3 testes de `lista_de_compras.robot` dependem um do outro (o usuário criado no primeiro é usado nos seguintes). Rode o arquivo inteiro. Filtrar só por `login` ou `lista-de-compras` faz o teste falhar, pois o usuário e a sessão não existem.

## Dados de teste e esperas

- No fluxo de lista de compras, nome, email e senha são gerados pela **FakerLibrary** a cada execução. Assim o teste pode rodar várias vezes sem erro de "email já utilizado".
- Os testes usam **esperas explícitas** (`Wait Until ...`) e não usam `Sleep`.

## Repetibilidade

O ServeRest é um ambiente público que apaga os dados periodicamente e recusa emails repetidos. Por isso nenhum teste depende de um usuário que já exista:

- `lista_de_compras.robot` e `login.robot` cadastram um usuário novo (Faker) antes dos testes.
- `cadastro.robot` usa a palavra `FAKER` na coluna EMAIL da tabela, que vira um email novo a cada execução.

Assim a suíte pode rodar várias vezes seguidas com o mesmo resultado.
