using System;
using System.Runtime.InteropServices;

Console.WriteLine("Hello, World!");
Console.WriteLine($"Running on: {RuntimeInformation.FrameworkDescription}");
Console.WriteLine($"Runtime Version: {Environment.Version}");
Console.WriteLine($"OS: {RuntimeInformation.OSDescription}");
