# LeBonDeal : site e-commerce fictif

## Introduction

"LeBonDeal" est une plateforme de e-commerce qui permet aux utilisateurs de vendre et d'acheter des produits en ligne. Pour garantir le bon fonctionnement du site et la sécurité des données, il est essentiel de mettre en place une base de données robuste et sécurisée.

## Table des Matières

1. [Introduction](#introduction)
2. [Structure du Projet](#structure-du-projet)
3. [Conception de la Base de Données](#conception-de-la-base-de-données)
   - [Modèle Conceptuel de Données (MCD)](doc/bdd/MCD.png)
   - [Modèle Logique de Données (MLD)](doc/bdd/MLD.png)
   - [Dictionnaire de Données](#dictionnaire-de-données)
   - [Règles de Gestion](#règles-de-gestion)
   - [Rôles et permissions](#rôles-et-permissions)
4. [Sécurité](#sécurité)
   - [Politique de sauvegarde](#politique-de-sauvegarde)
   - [Politique de rétention](#politique-de-rétention)
   - [Politique de protection des données (RGPD)](#politique-de-protection-des-données-rgpd)
5. [Choix Technologiques](#choix-technologiques)
   - [Méthodologie MERISE](#méthodologie-merise)
   - [Pourquoi utiliser PostgreSQL ?](#pourquoi-utiliser-postgresql)
6. [Benchmark : PostgreSQL vs MySQL](#benchmark--postgresql-vs-mysql-vs-sqlite)
7. [Propositions d'Amélioration](#propositions-damélioration)

## Conception de la Base de Données

### Méthodologie MERISE

**MERISE**, pour **ME**thode de **R**echerche et d'**I**ngénierie des **S**ystèmes d'**E**ntreprise, est une méthodologie d'analyse, de conception et de gestion de projets informatiques.

Elle est basée sur la modélisation des données et des traitements, permet de structurer et de formaliser les différentes étapes de la conception d'un système d'information. 

MERISE se décompose en plusieurs phases : l'étude préalable, l'étude détaillée, la conception, la réalisation et la maintenance.

**Pourquoi l'appliquer dans ce cas ?**

- **Structuration** : MERISE permet de structurer les données et les traitements de manière logique et cohérente.
- **Modélisation** : Elle facilite la modélisation des entités et des relations, ce qui est essentiel pour une base de données e-commerce.
Pour cela, elle utilise 2 modèles principaux : le Modèle Conceptuel de Données (MCD) et le Modèle Logique de Données (MLD).
- **Gestion de projet** : MERISE offre une approche méthodique pour la gestion de projet, assurant que toutes les étapes sont bien définies et suivies.


### Modèle Conceptuel de Données (MCD)

Le Modèle Conceptuel de Données (MCD) décrit les entités principales et leurs relations. 
Voici le MCD fourni dans le cadre du projet :

![Modèle Conceptuel de Données (MCD)](/doc/bdd/MCD.png)

*Note : ce MCD est volontairement incomplet pour lister des propositions d'amélioration, que vous trouverez plus bas.*

### Modèle Logique de Données (MLD)

Le Modèle Logique de Données (MLD) optimise les performances des requêtes et assure l'intégrité des données. 

Voici le MLD fourni :
![Modèle Logique de Données (MLD)](/doc/bdd/MLD.png)

*Note : ce MLD est volontairement incomplet pour lister des propositions d'amélioration.*

### Dictionnaire de Données

Le dictionnaire de données décrit les entités principales et leurs attributs pour la base de données du site e-commerce "LeBonDeal". 

Vous pouvez consulter le dictionnaire de données complet dans le fichier [dictionnaire-donnees.md](/doc/bdd/dictionnaire-donnees.md).

### Règles de Gestion

Les règles de gestion définissent les contraintes et les relations entre les différentes entités de la base de données. 

Vous pouvez consulter les règles de gestion complètes dans le fichier [listant les règles de gestion](/doc/regles-gestion.md).

### Rôles et Permissions

Les rôles et permissions sont définis pour garantir que les utilisateurs et les visiteurs ont accès uniquement aux fonctionnalités qui leur sont autorisées. 

Vous pouvez consulter les détails des rôles et permissions dans le fichier [dédié aux rôles et permissions](/doc/securite/rbac.md).

## Sécurité

### Politique de Sauvegarde

La politique de sauvegarde des données définit les procédures de sauvegarde, les responsabilités, les fréquences de sauvegarde, et les processus de restauration des données. 

Vous pouvez consulter la politique complète dans le fichier [politique-de-sauvegarde.md](/doc/bdd/sauvegardes/politique-de-sauvegarde.md).

### Politique de Rétention

La politique de rétention des données définit les règles et les procédures pour la gestion, la conservation et la suppression des données. 

Vous pouvez consulter la politique complète dans le fichier [dédié à la politique de rétention](/doc/securite/politique-de-retention.md).

### Politique de Protection des Données (RGPD)

Cette politique de protection des données décrit les types de données collectés, comment ils sont utilisés, les mesures appliquées pour les protéger, et les droits dont les utilisateurs disposent. 

Vous pouvez consulter la politique complète dans le fichier [dédié aux RGPD](/doc/securite/rgpd.md).

## Choix Technologiques

### Pourquoi utiliser PostgreSQL ?

#### Benchmark : PostgreSQL vs MySQL vs SQLite

PostgreSQL est un système de gestion de base de données relationnelle (SGBDR) open-source, reconnu pour sa fiabilité, sa robustesse et ses fonctionnalités avancées.

Afin de savoir quel SGBDR est le plus adapté pour ce projet, un benchmark a été réalisé pour comparer PostgreSQL à d'autres systèmes similaires comme MySQL, et SQLite.

Vous pouvez consulter ce benchmark comparant ces 3 SGBDR dans le fichier [comparatif](doc/benchmarks/bdd.md).

## Propositions d'Amélioration

Des propositions d'amélioration pour la base de données et le site e-commerce sont documentées dans le fichier [dédié aux propositions d'amélioration](doc/proposition-amelioration.md).