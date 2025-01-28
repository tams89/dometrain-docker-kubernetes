# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app
EXPOSE 80

# This stage is used to build the service project
COPY *.sln .
COPY DockerCourseApi/*.csproj ./DockerCourseApi/
COPY DockerCourseTests/*.csproj ./DockerCourseTests/
RUN dotnet restore ./DockerCourseApi/DockerCourseApi.csproj
RUN dotnet restore ./DockerCourseTests/DockerCourseTests.csproj

COPY . .
WORKDIR /app/DockerCourseApi
RUN dotnet publish -c Release -o out /p:UseAppHost=false --no-restore

FROM build AS test
WORKDIR /app/DockerCourseTests
COPY --from=build /app/DockerCourseTests .
RUN dotnet test

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/DockerCourseApi/out ./
ENTRYPOINT ["dotnet", "DockerCourseApi.dll"]