using Dapper;
using System.Data.SqlClient;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddCors();
var app = builder.Build();
app.UseCors(x => x.AllowAnyOrigin());

app.MapGet("/podcasts", async () =>
{
    var db = new SqlConnection("Server=database;Initial Catalog=podcasts;User Id=sa;Password=Dometrain#123;");
    var podcasts = (await db.QueryAsync<Podcast>("SELECT * FROM Podcasts")).Select(x => x.Title);
    return podcasts;
});

app.Run();

record Podcast(Guid Id, string Title);