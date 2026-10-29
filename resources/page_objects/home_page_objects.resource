*** Variables ***
${CADASTRESE_BUTTON}            link: Cadastre-se
${LOGOUT_BUTTON}                css: [data-testid="logout"]
${LISTA_PRODUTOS}               css: [data-testid="listaProdutos"]
${PRIMEIRO_PRODUTO_NOME}        xpath: (//*[@data-testid="adicionarNaLista"])[1]/ancestor::div[contains(@class, "card")][1]//h5
${PRIMEIRO_PRODUTO_ADICIONAR}   xpath: (//*[@data-testid="adicionarNaLista"])[1]
