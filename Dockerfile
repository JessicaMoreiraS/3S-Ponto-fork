FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS runtime
WORKDIR /Api/Api
COPY --from=build /app/MicroserviceDotnetCore/out ./
ENTRYPOINT ["dotnet", "Program.cs"]
