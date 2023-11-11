FROM microsoft/aspnetcore-build 
#mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY MicroserviceDotnetCore/*.csproj ./MicroserviceDotnetCore/
RUN dotnet restore

# copy everything else and build app
COPY MicroserviceDotnetCore/. ./MicroserviceDotnetCore/
WORKDIR /app/MicroserviceDotnetCore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/MicroserviceDotnetCore/out ./
ENTRYPOINT ["dotnet", "dotnet-msa.dll"]
