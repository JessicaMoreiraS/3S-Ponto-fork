# FROM microsoft/aspnetcore-build
# EXPOSE 4321
# WORKDIR /Api/Api
# COPY . .
# RUN dotnet restore
# ENTRYPOINT ["dotnet", "run"]
# CMD ["docker run", "start"]

# Use the .NET 6.0 SDK to build the application
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy the application files to the container
COPY . .

# Download the dependencies
RUN dotnet restore

# Build the application
RUN dotnet publish -c release -o /app

# Use the .NET 6.0 runtime for the final image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app

# Copy the built files from the build container to the final image
COPY --from=build /app .

# Set the ASPNETCORE_URLS environment variable so that Kestrel listens on port 80
ENV ASPNETCORE_URLS=http://*:80

# Execute o aplicativo quando o container for iniciado
ENTRYPOINT ["dotnet", "Api.dll"]
