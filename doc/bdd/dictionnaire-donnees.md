


# Dictionnaire de Données

## Utilisateur

| Code mnémonique | Désignation                          | Type          | Contraintes                          |
|-----------------|--------------------------------------|---------------|--------------------------------------|
| user_uuid       | Identifiant unique de l'utilisateur  | UUID          | PRIMARY KEY, SERIAL                  |
| user_pseudo     | Pseudonyme de l'utilisateur          | VARCHAR(50)   | NOT NULL, UNIQUE                     |
| username        | Nom d'utilisateur                   | VARCHAR(50)   | NOT NULL, UNIQUE                     |
| user_password   | Mot de passe de l'utilisateur        | VARCHAR(255)  | NOT NULL                             |
| created_at      | Date de création                    | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP            |

## Commande

| Code mnémonique    | Désignation                     | Type          | Contraintes                          |
|--------------------|---------------------------------|---------------|--------------------------------------|
| order_number       | Numéro de commande              | INT4          | PRIMARY KEY, SERIAL                  |
| user_uuid          | Identifiant de l'utilisateur    | UUID          | NOT NULL, FOREIGN KEY (user_uuid) REFERENCES Utilisateur(user_uuid) |
| order_total_cost_ht| Coût total HT                   | NUMERIC(10,2) | NOT NULL, CHECK (order_total_cost_ht >= 0)     |
| order_total_quantity| Quantité totale des produits   | INT4          | NOT NULL, CHECK (order_total_quantity >= 0)    |
| deliver_at         | Date de livraison               | TIMESTAMP     | YES                                  |
| created_at         | Date de création                | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP            |

## Produit

| Code mnémonique    | Désignation                     | Type          | Contraintes                          |
|--------------------|---------------------------------|---------------|--------------------------------------|
| product_uuid       | ID unique                       | UUID          | PRIMARY KEY                         |
| product_name       | Nom du produit                  | VARCHAR(100)  | NOT NULL                             |
| product_description| Description du produit          | TEXT          | NOT NULL                             |
| product_price      | Prix du produit                 | NUMERIC(10,2) | NOT NULL, CHECK (product_price > 0)  |
| product_quantity   | Quantité disponible en stock    | INT4          | NOT NULL, CHECK (product_quantity >= 0)|
| created_at         | Date de création                | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP            |
| updated_at         | Date de mise à jour             | TIMESTAMP     | DEFAULT CURRENT_TIMESTAMP            |