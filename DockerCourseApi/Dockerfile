FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["DockerCourseApi/*.csproj", "DockerCourseApi/"]
COPY ["DockerCourseTests/*.csproj", "DockerCourseTests/"]
COPY . .
RUN dotnet build DockerCourseApi/DockerCourseApi.csproj  -c Release -o /app/build
RUN dotnet test DockerCourseTests/DockerCourseTests.csproj
RUN dotnet publish DockerCourseApi/DockerCourseApi.csproj -c Release -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
EXPOSE 80
EXPOSE 443
WORKDIR /app
COPY --from=build /app/publish .

# Change user to non-root to improve security; gecos means don't interactively prompt for information
RUN adduser --disabled-password --gecos '' appuser
# RUN chown -R appuser /app/wwwroot Consider users privileges
USER appuser

ENTRYPOINT ["dotnet", "DockerCourseApi.dll"]