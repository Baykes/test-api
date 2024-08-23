var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
// Add services to the contain

app.Urls.Add("http://0.0.0.0:8080");
app.MapGet("/", () =>
{
    return "hello, world";
})
.WithName("hello");

app.Run();
