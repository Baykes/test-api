var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
// Add services to the contain

app.Urls.Add("http://0.0.0.0:8080");
app.MapGet("/api/", () =>
{
    return "This is my API";
})
.WithName("hello");

app.Run();
