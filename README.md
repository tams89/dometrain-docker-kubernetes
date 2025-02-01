tams89: Generate a readme for the items in folder Z:\dometrain-docker-kubernetes

Workspace: Collecting workspace information

# DomeTrain Docker Kubernetes

This repository contains the source code and configuration files for the DomeTrain Docker Kubernetes project. The project is divided into several components, each with its own directory and purpose.

## Project Structure

```
.github/
	workflows/
		build-api.yml
		build-frontend.yml
Database/
	CreateDatabaseAndSeed.sql
	Dockerfile
	wait-and-run.sh
docker-compose.yaml
DockerCourseApi/
	.dockerignore
	DockerCourseApi/
		appsettings.Development.json
		appsettings.json
		DockerCourseApi.csproj
		Dockerfile
		Program.cs
		Properties/
		Settings.cs
	DockerCourseApi.sln
	DockerCourseApi.Tests/
		ApiTests.cs
DockerCourseFrontend/
	.dockerignore
	DockerCourseFrontend/
		_Imports.razor
		...
	DockerCourseFrontend.sln
```

## Components

### Database

- **CreateDatabaseAndSeed.sql**: SQL script to create and seed the database.
- **Dockerfile**: Dockerfile to build the database image.
- **wait-and-run.sh**: Shell script to wait for the database to be ready and then run the SQL script.

### DockerCourseApi

- **DockerCourseApi.csproj**: Project file for the API.
- **Dockerfile**: Dockerfile to build the API image.
- **Program.cs**: Main entry point for the API.
- **appsettings.json**: Configuration file for the API.
- **appsettings.Development.json**: Development-specific configuration file for the API.
- **DockerCourseApi.sln**: Solution file for the API.
- **DockerCourseApi.Tests**: Unit tests for the API.

### DockerCourseFrontend

- **DockerCourseFrontend.csproj**: Project file for the frontend.
- **Dockerfile**: Dockerfile to build the frontend image.
- **_Imports.razor**: Import statements for the frontend.
- **DockerCourseFrontend.sln**: Solution file for the frontend.

### GitHub Workflows

- **build-api.yml**: GitHub Actions workflow to build and push the API Docker image.
- **build-frontend.yml**: GitHub Actions workflow to build and push the frontend Docker image.

### Docker Compose

- **docker-compose.yaml**: Docker Compose file to orchestrate the services.

## Getting Started

### Prerequisites

- Docker
- Docker Compose
- .NET SDK

### Building and Running

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/dometrain-docker-kubernetes.git
   cd dometrain-docker-kubernetes
   ```

2. Build and run the services using Docker Compose:
   ```sh
   docker-compose up --build
   ```

3. Access the frontend at `http://localhost:1234` and the API at `http://localhost:5102`.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
