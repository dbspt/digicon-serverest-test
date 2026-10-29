# digicon-serverest-test

Automação de testes web do [ServeRest](https://front.serverest.dev/) com Robot Framework, usando BDD (Dado/Quando/Então), Page Objects, esperas explícitas e tags.

## Estrutura

```
resources/
  configs/        # URL e browser por ambiente
  page_objects/   # Localizadores dos elementos
  pages/          # Ações de cada página
  steps/          # Steps BDD
tests/web/        # Suítes de teste
```

## Pré-requisitos

- Python 3.8+
- Google Chrome

```bash
python -m venv .venv
.venv/Scripts/python -m pip install -r requirements.txt
```

## Execução

```bash
# Todos os testes
.venv/Scripts/python -m robot -d results tests/

# Somente o fluxo end-to-end
.venv/Scripts/python -m robot -d results -i e2e tests/

# Por funcionalidade
.venv/Scripts/python -m robot -d results -i login tests/
.venv/Scripts/python -m robot -d results -i cadastro tests/
```

Tags disponíveis: `e2e`, `cadastro`, `login`, `carrinho`, `happy_path`, `faker`.

Os relatórios ficam em `results/`.
