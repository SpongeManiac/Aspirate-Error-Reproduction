var builder = DistributedApplication.CreateBuilder(args);

var mq = builder.AddRabbitMQ("rabbitmq");

var api = builder.AddProject<Projects.EchoAPI>("echoapi")
    .WaitFor(mq)
    .WithReference(mq);

var mqConsume = builder.AddAzureFunctionsProject<Projects.MQConsume>("mqconsume")
    .WaitFor(mq)
    .WithReference(mq);

builder.Build().Run();
