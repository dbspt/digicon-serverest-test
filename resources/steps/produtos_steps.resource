*** Settings ***
Documentation    Implementação concreta dos passos Gherkin de Produtos.
...              Camada Steps: liga cada frase "Dado/Quando/E/Então"
...              às ações definidas na camada de páginas.

Resource         ../pages/produtos_actions.resource

*** Keywords ***
Dado que acesso a lista de produtos
    Ir para a lista de produtos

Quando adiciono o primeiro produto à lista de compras
    Adicionar o primeiro produto à lista

Então devo ver o produto na minha lista de compras
    Verificar produto na lista de compras
