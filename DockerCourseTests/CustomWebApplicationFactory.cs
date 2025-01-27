using DockerCourseApi;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.Configuration;

namespace DockerCourseTests
{
    public class CustomWebApplicationFactory : WebApplicationFactory<Program>
    {
        protected override void ConfigureWebHost(IWebHostBuilder builder)
        {
            builder.ConfigureAppConfiguration(configBuilder =>
            {
                configBuilder.AddInMemoryCollection(
                [
                    new KeyValuePair<string, string?>("ConnectionString", "Server=tcp:localhost;Initial Catalog=podcasts;User Id=sa;Password=Dometrain#123;"),
                ]);
            });
        }
    }
}
