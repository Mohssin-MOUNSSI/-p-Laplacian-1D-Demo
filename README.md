# Démonstration du p-Laplacien en 1D

**Auteur :** Mohssin MOUNSSI  
**Formation doctorale :** Module M2 — Mon écosystème numérique

## Objectif

Ce dépôt présente un petit exemple MATLAB autonome destiné à illustrer le partage
d'un script scientifique via Git et GitHub. Il ne contient aucun code ni résultat
confidentiel du projet doctoral.

## Problème étudié

On considère le problème aux limites

$$
-\frac{\mathrm d}{\mathrm dx}
\left( |u'(x)|^{p-2}u'(x) \right)=1,
\qquad 0<x<1, \qquad u(0)=u(1)=0.
$$

Le script traite les deux cas `p = 2` et `p = 4` sur un maillage uniforme.
Il utilise une reconstruction élémentaire à partir du flux
$q(x)=\frac12-x$ et compare le résultat à la solution exacte

$$
u(x)=\frac{p-1}{p}
\left[
\left(\frac12\right)^{\frac{p}{p-1}}-
\left|x-\frac12\right|^{\frac{p}{p-1}}
\right].
$$

Il affiche les courbes, l'erreur maximale aux nœuds et le résidu discret.
Il ne s'agit pas d'un solveur non linéaire général.

## Exécution

1. Ouvrir `demo_p_laplacien_1D.m` dans MATLAB.
2. Exécuter le script (bouton **Run**).
3. Consulter la figure produite et les valeurs affichées dans la fenêtre de commande.

Aucune toolbox spécifique ni dépendance externe n'est nécessaire.

## Fichiers

- `demo_p_laplacien_1D.m` : script MATLAB pédagogique.
- `README.md` : présentation et instructions.

## Cadre d'utilisation

Ce dépôt est préparé uniquement pour le mini-projet de formation doctorale
« Mon écosystème numérique » et pour illustrer la publication d'un document
scientifique sur GitHub. Il ne reproduit pas les algorithmes THB-IGA ni les
résultats inédits du projet de recherche.
