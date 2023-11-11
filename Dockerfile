# FROM microsoft/aspnetcore-build
# EXPOSE 4321
# WORKDIR /Api/Api
# COPY . .
# RUN dotnet restore
# ENTRYPOINT ["dotnet", "run"]
CMD ["docker run", "start"]
