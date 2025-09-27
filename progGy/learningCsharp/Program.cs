using System;

// RULE 1: Only ONE Main() method per program (entry point)
class Program
{
    // This is THE Main method - program starts here
    static void Main(string[] args)  // string[] args = command line arguments
    {
        Console.WriteLine("Program started!");
        
        // Print command line arguments if any
        Console.WriteLine($"Number of arguments: {args.Length}");
        for (int i = 0; i < args.Length; i++)
        {
            Console.WriteLine($"Argument {i}: {args[i]}");
        }
        
        // RULE 2: From static Main(), you can only call static methods directly
        StaticMethod();        // ✅ Works - both static
        
        // NonStaticMethod();  // ❌ ERROR - can't call non-static from static
        
        // To call non-static methods, you need to create an object:
        Program program = new Program();
        program.NonStaticMethod();  // ✅ Now it works
        
        // Or call static methods from other classes:
        Calculator.Add(5, 3);
    }
    
    // RULE 3: Static methods - belong to the class, not to instances
    static void StaticMethod()
    {
        Console.WriteLine("This is a static method");
        // Static methods can only call other static methods directly
        AnotherStaticMethod();  // ✅ Works
        
        // NonStaticMethod();   // ❌ ERROR - can't call non-static
    }
    
    static void AnotherStaticMethod()
    {
        Console.WriteLine("Another static method");
    }
    
    // RULE 4: Non-static methods - need an object instance
    void NonStaticMethod()  // No 'static' keyword
    {
        Console.WriteLine("This is a non-static method");
        // Non-static methods can call both static and non-static methods
        StaticMethod();        // ✅ Works
        AnotherNonStatic();    // ✅ Works
    }
    
    void AnotherNonStatic()
    {
        Console.WriteLine("Another non-static method");
    }
    
    // Your physics methods - if called from Main(), they should be static
    static double CalcTime(double distance, double velocity, double acceleration)
    {
        Console.WriteLine("Calculating time...");
        return distance / velocity; // Simplified calculation
    }
}

// You can have multiple classes, but only one Main() in the entire program
class Calculator
{
    public static int Add(int a, int b)  // ✅ Added 'public'
    {
        return a + b;
    }
}

/*
COMMAND LINE ARGUMENTS EXAMPLE:
If you run: MyProgram.exe hello world 123
Then args[] will contain:
args[0] = "hello"
args[1] = "world" 
args[2] = "123"

MAIN METHOD VARIATIONS (all valid):
static void Main()                     // No parameters
static void Main(string[] args)        // With command line args
static int Main()                      // Returns exit code
static int Main(string[] args)         // Both args and exit code
*/