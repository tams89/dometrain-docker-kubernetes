using Dapper;
using Microsoft.Extensions.Options;
using System.Data.SqlClient;

namespace DockerCourseApi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            builder.Services.AddCors();
            builder.Services.Configure<Settings>(builder.Configuration);

            var app = builder.Build();
            app.UseCors(x => x.AllowAnyOrigin());

            app.MapGet("/podcasts", async (IOptions<Settings> settings) =>
            {
                var db = new SqlConnection(settings.Value.ConnectionString);
                var podcasts = (await db.QueryAsync<Podcast>("SELECT * FROM Podcasts")).Select(x => x.Title);
                return podcasts;
            });

            app.Run();
        }
    }

    record Podcast(Guid Id, string Title);
}