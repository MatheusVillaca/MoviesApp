![Platform](https://img.shields.io/badge/Platform-iOS-blue.svg?style=for-the-badge)
![Swift Version](https://img.shields.io/badge/Swift-5.3-orange.svg?style=for-the-badge&logo=swift)
![iOS Version](https://img.shields.io/badge/iOS-14.5+-green.svg?style=for-the-badge) 
![Xcode Version](https://img.shields.io/badge/Xcode-13+-blue.svg?style=for-the-badge)

# MoviesApp

Terceiro aplicativo desenvolvido por mim, visando otimizar meu aprendizado, ultilizando cada vez mais novos e desafiadores recursos adquiridos através de mentoria e estudos.

Um aplicativo de filmes, onde podemos obter diversas informações sobre os mesmos.

## Tecnologias

O app foi desenvolvido em `Swift`, seguindo a arquitetura `MVC`.

As telas foram desenvolvidas ***programaticamente***, implementando o protocolo `ViewCode`, visando assim seguir um padrão.

Foi ultilizado o gerenciador de dependências `CocoaPods` para adicionar a biblioteca `KingFisher`.

A navegação do app foi montada com `UITabBarController`, onde a listagem dos elementos foi feita com `UICollectionView`.

Para os detalhes especificos de cada filme, temos um `push`, atraves da função `didSelectItemAt`, exibindo assim, nossa `ViewController` responsável. Onde ultilizo de uma `UITableView` para distribuição dos elementos. 

O armazenameto local de favoritos foi implementado ultilizando o `UserDefaults`.

Os dados apresentados foram extraídos de duas APIs públicas, uma retornando os [Filmes mais populares](https://imdb-api.com/API/MostPopularMovies), e a outra retornando os [Detalhes](https://imdb-api.com/pt-br/API/Title) de cada filme, filtrando os mesmos através de seus respectivos id`s, onde o JSON retornado foi decodificado ultilizando o protocolo Codable.

## Desafios

A cada app, venho melhorando significativamente minha performace, utilizando de recursos cada vez mais desafiadores.

Tenho visado manter um código ***limpo***, muito bem escrito e arquitetado, buscando sempre um código ***reutilizável***, ***genérico***, e muito bem ***organizado***, para rápido e fácil entendimento. 
