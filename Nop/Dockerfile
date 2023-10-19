FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL Author="Tejaswini"
LABEL Project="Nop Commerce"
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.5/nopCommerce_4.60.5_NoSource_linux_x64.zip /nopcommerce/nopCommerce_4.60.5_NoSource_linux_x64.zip
WORKDIR /nopcommerce
RUN apt update && \
    apt install unzip && \
    unzip nopCommerce_4.60.5_NoSource_linux_x64.zip && \
    mkdir /nopcommerce/bin && mkdir /nopcommerce/logs 
EXPOSE 5000 
CMD ["dotnet", "Nop.Web.dll","--urls", "http://0.0.0.0:5000"]
