## 🛒 Développement d'une API REST e-commerce avec Flask

## 📋 Présentation du projet

L'entreprise **DigiMarket**, spécialisée dans la vente de matériel informatique, souhaite lancer sa boutique en ligne. Votre mission est de développer le backend de cette plateforme e-commerce en créant une API REST avec le framework Flask.

Cette API devra permettre la gestion des produits, des catégories, des commandes et des utilisateurs pour une plateforme e-commerce standard, avec un système d'authentification.

![ecom_digimarket](https://i.postimg.cc/Zq9D0j9k/image.png)

## 🛠️ Technologies et outils

- **Langage**: Python
- **Framework backend**: Flask
- **Base de données :** SQLite avec SQLAlchemy comme ORM
- **Authentification**: JWT (JSON Web Tokens)
  
## 🧩 Fonctionnalités de l'application

### 👤 Gestion des utilisateurs

L'application propose deux types de profils :
- **Clients** : Peuvent créer un compte, se connecter, parcourir le catalogue, passer des commandes et suivre l'état de leurs commandes.
- **Administrateurs** : Disposent des droits de gestion du catalogue produits, de suivi et modification des commandes.

La création de compte nécessite une adresse email unique, un mot de passe sécurisé et les informations personnelles de base. Lors de la connexion, l'utilisateur reçoit un token d'authentification lui permettant d'accéder aux fonctionnalités selon son rôle.

- Inscription d'un nouvel utilisateur (POST /api/auth/register)
- Connexion et génération de token JWT (POST /api/auth/login)

### 📦 Catalogue produits

**Pour les visiteurs et clients :**

- Navigation dans le catalogue complet des produits
- Affichage des détails d'un produit (description, prix, disponibilité)
- Recherche de produits par nom ou caractéristiques

**Pour les administrateurs :**

- Ajout de nouveaux produits au catalogue
- Modification des informations produits existants
- Gestion des stocks
- Suppression de produits du catalogue

Chaque produit dispose d'une fiche détaillée incluant son nom, sa description complète, sa catégorie, son prix et sa disponibilité en stock.

- Récupérer la liste des produits (GET /api/produits)
- Récupérer un produit spécifique (GET /api/produits/{id})
- Créer un nouveau produit (POST /api/produits) - *Admin uniquement*
- Modifier un produit existant (PUT /api/produits/{id}) - *Admin uniquement*
- Supprimer un produit (DELETE /api/produits/{id}) - *Admin uniquement*

### 🛍️ Gestion des commandes

**Pour les clients :**

- Création d'une nouvelle commande
- Ajout de produits au panier avec les quantités souhaitées
- Spécification de l'adresse de livraison
- Consultation de l'historique des commandes
- Suivi de l'état d'avancement d'une commande

**Pour les administrateurs :**

- Consultation de toutes les commandes de la plateforme
- Modification du statut des commandes (en attente, validée, expédiée, annulée)
- Visualisation détaillée du contenu de chaque commande

Le système doit s'assurer que les produits commandés sont disponibles en stock et mettre à jour automatiquement les quantités disponibles lors de la validation d'une commande.

- Récupérer la liste des commandes (GET /api/commandes) - *Admin voit tout, client voit ses commandes*
- Récupérer une commande spécifique (GET /api/commandes/{id})
- Créer une nouvelle commande (POST /api/commandes) - *Authentification requise*
- Modifier le statut d'une commande (PATCH /api/commandes/{id}) - *Admin uniquement*
- Consulter les lignes d'une commande (GET /api/commandes/{id}/lignes)

## 📊 Structure des données

L'application s'appuie sur quatre entités principales :

1. **Utilisateurs** : Stocke les informations de compte client et administrateur
2. **Produits** : Contient les informations du catalogue et des stocks
3. **Commandes** : Enregistre les informations générales des commandes passées
4. **Lignes de commande** : Détaille le contenu précis de chaque commande

#### Utilisateur

| Champ | Type | Description |
|-------|------|-------------|
| id | Integer | Clé primaire |
| email | String | Email unique de l'utilisateur |
| mot_de_passe | String | Mot de passe haché |
| nom | String | Nom de l'utilisateur |
| role | String | Role: 'client' ou 'admin' |
| date_creation | DateTime | Date de création du compte |

#### Produit

| Champ | Type | Description |
|-------|------|-------------|
| id | Integer | Clé primaire |
| nom | String | Nom du produit |
| description | Text | Description détaillée |
| categorie | String | Nom de la catégorie |
| prix | Float | Prix unitaire |
| quantite_stock | Integer | Quantité disponible en stock |
| date_creation | DateTime | Date d'ajout du produit |

#### Commande

| Champ | Type | Description |
|-------|------|-------------|
| id | Integer | Clé primaire |
| utilisateur_id | Integer | Clé étrangère vers Utilisateur |
| date_commande | DateTime | Date de création de la commande |
| adresse_livraison | String | Adresse de livraison |
| statut | String | Statut: 'en_attente', 'validée', 'expédiée', 'annulée' |

#### LigneCommande

| Champ | Type | Description |
|-------|------|-------------|
| id | Integer | Clé primaire |
| commande_id | Integer | Clé étrangère vers Commande |
| produit_id | Integer | Clé étrangère vers Produit |
| quantite | Integer | Quantité commandée |
| prix_unitaire | Float | Prix unitaire au moment de la commande |

## 🔍 Exigences techniques

### Architecture de l'application

L'application doit suivre une architecture modulaire :
- Séparation claire entre les modèles, les contrôleurs et les vues (JSON)
- Organisation en modules fonctionnels à l'aide des Blueprints Flask
- Implémentation des bonnes pratiques REST

### Sécurité et authentification

- Authentification sécurisée via tokens JWT
- Hachage des mots de passe
- Vérification des autorisations selon le rôle utilisateur
- Protection contre les injections SQL et autres vulnérabilités courantes

### Qualité du code

- Code bien structuré et commenté
- Gestion appropriée des erreurs et exceptions
- Tests unitaires et fonctionnels
- Documentation complète de l'API

## 📝 Livrables attendus

1. **Code source**
   - Structure de projet claire et organisée
   - Fichier requirements.txt listant toutes les dépendances
2. **Application fonctionnelle** avec toutes les fonctionnalités demandées
3. **Documentation technique (README.md)**:
   - Instructions d'installation et d'utilisation
   - Description des fonctionnalités
   - Documentation de l'API
4. **Base de données** initialisée avec des données de test
5. **Tests** couvrant les principales fonctionnalités

## 🎯 Critères d'évaluation

Votre projet sera évalué, par un jury professionnel, en adéquation avec les critères d'évaluation du référentiel de certification, comme précisé en introduction. Voici un échantillonnage des critères évalués : 

- La syntaxe, l'architecture et les fonctionnalités du framework sont maîtrisées 
- Le choix des dépendances installées est cohérent avec le projet à réaliser 
- La compatibilité de la version du framework et de ses dépendances est 
respectée 
- Les variables d'environnement sont correctement renseignées. 
- Les solutions existantes du framework sont utilisées pour résoudre des  dysfonctionnements  
- Les erreurs de développement sont identifiées 
- Les outils de débogage sont maîtrisés 
- L'application livrée est fonctionnelle 