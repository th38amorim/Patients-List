# Patients List

Este projeto é uma aplicação para listagem de pacientes, com a possibilidade de adição de filtros para refinar os resultados. Como exemplo de funcionalidade, foi implementado um filtro baseado no sexo dos pacientes. A aplicação utiliza a biblioteca [Flutter Bloc](https://pub.dev/packages/flutter_bloc) para gerenciamento e controle de estado, garantindo uma experiência fluída e reativa ao usuário.

## Arquitetura

O projeto adota a arquitetura [Clean Dart](https://github.com/Flutterando/Clean-Dart), estruturando-se nas seguintes camadas:

- **Data**: Esta camada é responsável pela obtenção dos dados, seja através de APIs, bancos de dados ou outros meios. Nela, você encontrará o código relacionado ao acesso e recuperação dos dados dos pacientes.
  
- **Domain**: Esta camada define as entidades e regras de negócio da aplicação. Ela atua como uma ponte entre a camada de dados e a camada de apresentação, garantindo que os dados sejam processados de acordo com as regras estabelecidas.
  
- **Presentation**: É aqui que a lógica da interface do usuário está localizada. Esta camada determina como os dados serão exibidos ao usuário e como ele poderá interagir com eles.

## Integração com a API do GitHub

O projeto utiliza o pacote [http](https://pub.dev/packages/http) para consumir a API do GitHub. Especificamente, ele recupera informações dos pacientes a partir de um arquivo JSON hospedado no repositório do GitHub. Esta implementação permite que a aplicação busque dados em tempo real do repositório, proporcionando flexibilidade para atualizações e manutenções.

## Funcionalidades

- **Listagem de Pacientes**: O aplicativo recupera e lista informações detalhadas sobre os pacientes de um arquivo JSON hospedado no GitHub.
  
- **Filtragem de Pacientes**: O usuário tem a possibilidade de filtrar os pacientes listados com base em critérios específicos. Atualmente, como demonstração, há um filtro implementado para refinar a lista com base no sexo do paciente.
  
