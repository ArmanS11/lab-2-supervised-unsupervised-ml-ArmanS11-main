FROM ubuntu:18.04
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         ca-certificates \
         libjpeg-dev \
         libpng-dev && \
     rm -rf /var/lib/apt/lists/*
RUN apt update
RUN apt install -y python3-pip python3-matplotlib python3-pandas python3-numpy python3-scipy
RUN pip3 install jupyter scikit-learn imbalanced-learn ipython

ENV PROJECT_DIR $HOME/workspace
RUN mkdir $PROJECT_DIR

WORKDIR $PROJECT_DIR
RUN chmod -R a+w .
EXPOSE 8888
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]

