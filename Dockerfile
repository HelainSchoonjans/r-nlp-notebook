FROM jupyter/r-notebook

LABEL maintainer="Hélain Schoonjans <helain.schoonjans@outlook.com>"

USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    tzdata \
    gfortran \
    gcc && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

# R packages
RUN conda install  --no-update-dependencies --quiet --yes \
    'r-Rcpp' \
#    'r-udpipe' \
#    'r-textrank' \
    'r-rlang' \
    'r-knitr' \
#    'r-textcat' \
    'r-stringdist' \
#    'r-tau' \
#    'r-wordcloud' \
    'r-tm' \
    'r-corrplot' \
#    'r-widyr' \
    'r-magrittr' \
    'r-ggraph' \
    'r-igraph' \
    'r-SnowballC' \
    'r-rJava' \
#    'r-dat.table' \
    'r-stringi' \
#    'r-cld2' \
    'r-NLP' \
#    'r-openNLP' \
#    'r-koRpus' \
#    'r-qdap' \
    'r-mass' \
#    'r-topicmodels' \
    'r-slam' \
#    'r-LDAvis' \
#    'r-servr' \
    'r-glmnet' \
    'r-caret' \
#    'r-textreuse' \
#    'r-text2vec' \
#    'r-PythonInR' \
    'r-digest' \
    'r-devtools' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR
