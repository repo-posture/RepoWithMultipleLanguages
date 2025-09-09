FROM ubuntu:20.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install common build tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    unzip \
    wget \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install Python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Java
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

# Install Go
RUN wget https://golang.org/dl/go1.17.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz \
    && rm go1.17.linux-amd64.tar.gz \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile

# Install PHP
RUN apt-get update && apt-get install -y \
    php \
    composer \
    && rm -rf /var/lib/apt/lists/*

# Install Ruby
RUN apt-get update && apt-get install -y \
    ruby-full \
    && rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && echo "source $HOME/.cargo/env" >> /etc/profile

# Install .NET Core
RUN apt-get update && apt-get install -y curl && \
    curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel LTS && \
    echo 'export PATH="$PATH:$HOME/.dotnet"' >> /etc/profile && \
    echo 'export DOTNET_ROOT="$HOME/.dotnet"' >> /etc/profile

# Haskell
RUN apt-get update && apt-get install -y \
    ghc \
    cabal-install \
    && rm -rf /var/lib/apt/lists/*

# R
RUN apt-get update && apt-get install -y \
    r-base \
    && rm -rf /var/lib/apt/lists/*

# # Install Elixir (via official repositories)
# RUN apt-get update && apt-get install -y curl gnupg && \
#     curl -fsSL https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | gpg --dearmor -o /usr/share/keyrings/erlang-solutions.gpg && \
#     echo "deb [signed-by=/usr/share/keyrings/erlang-solutions.gpg] https://packages.erlang-solutions.com/ubuntu focal contrib" > /etc/apt/sources.list.d/erlang-solutions.list && \
#     apt-get update && \
#     apt-get install -y esl-erlang elixir && \
#     rm -rf /var/lib/apt/lists/*

# Swift dependencies
RUN apt-get update && apt-get install -y \
    clang \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /app

# Copy all application code
COPY . /app/

# Set default command (can be overridden)
CMD ["bash"]