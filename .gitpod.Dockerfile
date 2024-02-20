FROM gitpod/workspace-python:latest
# FROM gitpod/workspace-python-3.11:latest

# see also https://www.gitpod.io/docs/introduction/languages/python#python-versions

# To try this before committing:
# docker build -f .gitpod.Dockerfile -t gitpod-dockerfile-test .
# docker run -it gitpod-dockerfile-test bash

RUN pip install --upgrade pip

RUN pip install ansible molecule "molecule-plugins[docker]" yamllint ansible-lint

# rsync is required by Molecule when building a Docker image from a custom file
# install-packages is a wrapper for `apt` that helps skip a few commands in the docker env.
RUN sudo install-packages \
    rsync

# we also install chezmoi in the Gitpod Ubuntu to do some experiments
# and to build the chezmoi dotfiles from within Gitpod
RUN sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
