# Use an official Ubuntu as a parent image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV RBENV_ROOT="/root/.rbenv"
ENV PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"

# Install required packages
RUN apt update && apt install -y \
    build-essential \
    curl \
    git \
    libssl-dev \
    zlib1g-dev \
    postgresql \
    libpq-dev \
    ca-certificates \
    gnupg \
    libicu-dev \
    imagemagick

# Initialize rbenv and install Ruby
RUN git clone https://github.com/rbenv/rbenv.git $RBENV_ROOT && \
    git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.profile && \
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile && \
    rbenv install 3.0.2 && \
    rbenv global 3.0.2

# Install Node.js and Yarn
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    NODE_MAJOR=18 && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn
# Install Decidim
RUN gem install --no-document decidim && \
    decidim decidim_application
WORKDIR /decidim_application


# Configure the database
RUN git clone https://github.com/rbenv/rbenv-vars.git $RBENV_ROOT/plugins/rbenv-vars 


# Expose port 3000
EXPOSE 3000
CMD ["bin/rails", "s", "-b", "0.0.0.0"]

