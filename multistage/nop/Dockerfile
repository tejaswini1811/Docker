FROM ubuntu:20.04 AS extract
RUN apt update && apt install unzip 
ARG DOWNLOAD_URL=https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.5/nopCommerce_4.60.5_NoSource_linux_x64.zip
WORKDIR /nopCommerce
ADD ${DOWNLOAD_URL} nopCommerce_4.60.5_NoSource_linux_x64.zip
RUN unzip nopCommerce_4.60.5_NoSource_linux_x64.zip && mkdir bin logs && rm nopCommerce_4.60.5_NoSource_linux_x64.zip

FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL Author="Tejaswini"
LABEL Project="Nop Commerce"
ARG HOME_DIR=/nopcommerce
ARG USER=nopcommerce
ARG GROUP=nopcommerce
ARG UID=1000
ARG GID=1000
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
COPY --from=extract /nopCommerce ${HOME_DIR}
RUN groupadd -g ${GID} ${GROUP} && \
    useradd -d ${HOME_DIR} -g ${GID} -u ${UID} -m -s /bin/bash ${USER} && \
    chown -R ${USER}:${GROUP} ${HOME_DIR}
USER ${USER}
WORKDIR ${HOME_DIR}
EXPOSE 5000 
CMD [ "dotnet", "Nop.Web.dll"]