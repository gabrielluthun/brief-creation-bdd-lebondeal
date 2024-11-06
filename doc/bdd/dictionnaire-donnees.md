# Dictionnaire de Données

## Utilisateur

| Code mnémonique | Désignation                          | Type          | Contraintes                          |
|-----------------|--------------------------------------|---------------|--------------------------------------|
| user_id         | Identifiant unique de l'utilisateur  | INTEGER       | PRIMARY KEY, AUTO_INCREMENT          |
| username        | Pseudonyme de l'utilisateur          | VARCHAR(50)   | NOT NULL, UNIQUE                     |
| password        | Mot de passe de l'utilisateur        | VARCHAR(255)  | NOT NULL                             |

## Commande

| Code mnémonique | Désignation                     | Type          | Contraintes                          |
|-----------------|---------------------------------|---------------|--------------------------------------|
| order_id        | Numéro de commande              | INTEGER       | PRIMARY KEY, AUTO_INCREMENT          |
| user_id         | Identifiant de l'utilisateur    | INTEGER       | NOT NULL, FOREIGN KEY (user_id) REFERENCES Utilisateur(user_id) |
| total_cost      | Coût total HT                   | NUMERIC       | NOT NULL, CHECK (total_cost > 0)     |
| total_quantity  | Quantité totale des produits    | INTEGER       | NOT NULL                             |
| delivery_date   | Date de livraison               | DATE          | NOT NULL                             |
| confirmed       | Confirmation de la commande     | BOOLEAN       | NOT NULL                             |

## Produit

| Code mnémonique | Désignation                     | Type          | Contraintes                          |
|-----------------|---------------------------------|---------------|--------------------------------------|
| product_id      | ID unique                       | INTEGER       | PRIMARY KEY, AUTO_INCREMENT          |
| product_name    | Nom                             | VARCHAR(100)  | NOT NULL                             |
| product_desc    | Description                     | TEXT          | NOT NULL                             |
| product_price   | Prix                            | NUMERIC       | NOT NULL, CHECK (product_price > 0)  |
| product_qty     | Quantité disponible en stock    | INTEGER       | NOT NULL                             |

## Visiteur

| Code mnémonique     | Désignation                     | Type          | Contraintes                          |
|---------------------|---------------------------------|---------------|--------------------------------------|
| visitor_id          | Identifiant unique              | INTEGER       | PRIMARY KEY, AUTO_INCREMENT          |
| visitor_username    | Pseudonyme                      | VARCHAR(50)   | NOT NULL, UNIQUE                     |
| visitor_password    | Mot de passe                    | VARCHAR(255)  | NOT NULL                             |