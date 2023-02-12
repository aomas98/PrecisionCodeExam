using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Prcecision.Master.Data.Core.EntityModel;
using Prcecision.Master.Data.Core.IService;
using Prcecision.Master.Data.Core.Service;
using Precision.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Microsoft.AspNetCore.Server.Kestrel.Core;

var builder = WebApplication.CreateBuilder(args);
builder.Services.Configure<KestrelServerOptions>(builder.Configuration.GetSection("Kestrel"));
// Add services to the container.
var applicationkeys = builder.Configuration.GetSection("ApplicationKeys").Get<ApplicationKeys>();

var clients = new List<string>();
builder.Configuration.GetSection("ClientSites").Bind(clients);

//builder.Services.AddCors(
//    options =>
//    {
//        options.AddDefaultPolicy(
//            builder => builder
//                .WithOrigins(clients.ToArray())
//                .AllowAnyMethod()
//                .AllowAnyHeader()
//                .AllowCredentials()
//        );
//    });


builder.Services.AddCors(options =>
{
    options.AddPolicy(
    name: "AllowOrigin",
    builder => {
        builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
    });
});

// Add services to the container.
builder.Services.AddDbContext<PrecisionContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("PreciseConsString")));
builder.Services.AddScoped<DbContext, PrecisionContext>();

builder.Services.AddScoped<IUsersService, UsersService>();
builder.Services.AddScoped<ILeaveRequestService, LeaveRequestService>();

builder.Services.AddControllersWithViews().AddNewtonsoftJson(options =>
{
    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
    options.SerializerSettings.ContractResolver = new DefaultContractResolver();
});


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("AllowOrigin");

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
