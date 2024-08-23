FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine as build
WORKDIR /app

COPY . .
RUN dotnet restore
RUN dotnet publish -l /app/published-app -- configuration Release

FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine as runtime
WORKDIR /app
COPY --from=build /app/published-app /app

ENV ASPNETCORE_ENVIRONMENT = production
ENV IS_GOOGLE_CLOUD = true
ENTRYPOINT [ "dotnet", "/app/grc-dotnet6-api.dll"]