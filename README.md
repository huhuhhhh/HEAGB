# HEAGB
Data based analytical model (DBAM) and machine learning for HEA GBs

This repository contains the data and code for our recent work:

C. Hu and J. Luo, Decoding the Grain Boundary Thermodynamics in High-Entropy Alloys: A Data-Based Analytical Model beyond Machine Learning, https://arxiv.org/abs/2012.12865

The current repository demonstrates the use of DBAM and ANN models for predicting GB properties for CrMnFeCoNi HEAs.

Table of Content:

ANN_binary: trained artificial neural network (ANN) models and matlab scripts for constructing binary GB diagrams of:
            1. Co-Cr, 2. Co-Fe, 3. Co-Mn, 4. Co-Ni, 5. Fe-Cr, 6. Fe-Mn, 7. Mn-Cr, 8. Ni-Cr, 9. Ni-Fe, 10. Ni-Mn

ANN_ternary: trained ANN models and matlab scripts for constructing ternary GB diagrams of two representative ternary systems:
            1. Co-Cr-Fe and 2. Co-Cr-Mn

Cr: DBAM script for fitting DBAM data for Cr segregation and matlab script for training ANN models

Mn: DBAM script for fitting DBAM data for Mn segregation and matlab script for training ANN models

Fe: DBAM script for fitting DBAM data for Fe segregation and matlab script for training ANN models

Ni: DBAM script for fitting DBAM data for Ni segregation and matlab script for training ANN models

Co: DBAM script for fitting DBAM data for Co segregation and matlab script for training ANN models

Disorder: DBAM script for fitting DBAM data for GB excess of disordering and matlab script for training ANN models

Matlab Installation: Deep Learning Toolbox is needed to train ANN models 
