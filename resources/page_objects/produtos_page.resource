*** Settings ***
Documentation    Mapeamento dos elementos (locators) das páginas de Produtos
...              e Lista de Compras.
...              Camada Objetos: só o "onde" está cada elemento na tela.

*** Variables ***
# Home (lista de produtos)
${HOME_URL}                  ${URL}home
${BOTAO_ADICIONAR_LISTA}     css:[data-testid="adicionarNaLista"]
${BOTAO_LOGOUT}              css:[data-testid="logout"]

# Lista de compras
${URL_LISTA_COMPRAS}         minhaListaDeProdutos
${NOME_PRODUTO_LISTA}        css:[data-testid="shopping-cart-product-name"]
${QTD_PRODUTO_LISTA}         css:[data-testid="shopping-cart-product-quantity"]
