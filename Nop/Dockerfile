FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL Author="Tejaswini"
LABEL Project="Nop Commerce"
ARG DOWNLOAD_URL=https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.5/nopCommerce_4.60.5_NoSource_linux_x64.zip
ARG HOME_DIR=/nopcommerce
ARG USER=nopcommerce
ARG GROUP=nopcommerce
ARG UID=1000
ARG GID=1000
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
RUN apt update &&\
    apt install unzip && \
    groupadd -g ${GID} ${GROUP} && \
    useradd -d ${HOME_DIR} -g ${GID} -u ${UID} -m -s /bin/bash ${USER}
ADD --chown=${USER}:${GROUP} ${DOWNLOAD_URL} ${HOME_DIR}/nopCommerce_4.60.5_NoSource_linux_x64.zip
USER ${USER}
WORKDIR ${HOME_DIR}
RUN unzip nopCommerce_4.60.5_NoSource_linux_x64.zip && \
    mkdir ${HOME_DIR}/bin && mkdir ${HOME_DIR}/logs 
EXPOSE 5000 
CMD [ "dotnet", "Nop.Web.dll"]