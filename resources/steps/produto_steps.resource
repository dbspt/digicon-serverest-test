language: pt-br

*** Configurações ***
Documentação        Implementação dos Steps da funcionalidade
...                 Produto / Carrinho.

Biblioteca          SeleniumLibrary
Recurso             ../pages/produto_page.resource


*** Palavras-Chave ***
que estou na página principal da Serverest Store
    Esperar o catálogo de produtos carregar


adiciono o produto na lista pela página principal
    Adicionar produto na lista pela página principal


sou redirecionado para a página de carrinho
    Esperar a página de carrinho carregar


adiciono o produto ao carrinho
    Adicionar produto ao carrinho


o produto deve constar no carrinho
    Validar produto no carrinho
