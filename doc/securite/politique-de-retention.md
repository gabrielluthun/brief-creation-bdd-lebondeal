# Politique de Rétention des Données

Pour un site de e-commerce comme "LeBonDeal", il est crucial de définir une politique de rétention des données appropriée pour plusieurs raisons.

Premièrement, cela garantit le respect des réglementations en vigueur, notamment en matière de conservation des données personnelles.

Deuxièmement, du point de vue de la sécurité, conserver des données indéfiniment augmente les risques en cas d'attaques par injection SQL ou par force brute. Plus la quantité de données sensibles est importante, plus la surface d’attaque potentielle est grande.

Troisièmement, épurer régulièrement la base de données assure son optimisation en termes de performance. En effet, un volume de données trop important peut impacter négativement les performances des requêtes.

Enfin, stocker des données a un coût, notamment en ce qui concerne les sauvegardes quotidiennes et les archives. Limiter la durée de conservation des données permet de réduire ces coûts.

## Rétention des Données Clients

En cas de relation client active, c'est-à-dire que le client se connecte régulièrement ou passe des commandes, il est approprié de conserver son compte et les données qui y sont liées.

Cependant, si le client ne se connecte pas pendant 2 ans, un rappel lui sera envoyé pour réactiver son compte. Si aucune action n'est prise dans les trois mois suivants, son compte sera désactivé et ses données seront anonymisées.

## Conservation des Historiques d'Achats

Conformément aux obligations légales, les informations relatives aux achats doivent être conservées pendant une période de 5 ans après la date de l'achat. Au-delà de cette période, il est recommandé de les archiver afin qu'elles ne soient plus accessibles depuis la base de données principale.

## Données de Paiement

Conserver des données de paiement dans la base de données est fortement déconseillé. Non seulement cela est soumis à une réglementation stricte, mais cela augmente également le risque d'attaque. Il est judicieux de passer par un prestataire externe comme PayPal pour limiter notre responsabilité et se conformer plus facilement à la réglementation.