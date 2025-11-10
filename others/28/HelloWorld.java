public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("=================================");
        System.out.println("  Hello from Docker Container!");
        System.out.println("=================================");
        System.out.println();
        System.out.println("Java Version: " + System.getProperty("java.version"));
        System.out.println("OS: " + System.getProperty("os.name"));
        System.out.println("User: " + System.getProperty("user.name"));
        System.out.println();
        
        // Simple calculation demo
        Calculator calc = new Calculator();
        System.out.println("Calculator Demo:");
        System.out.println("10 + 5 = " + calc.add(10, 5));
        System.out.println("10 - 5 = " + calc.subtract(10, 5));
        System.out.println("10 * 5 = " + calc.multiply(10, 5));
        System.out.println("10 / 5 = " + calc.divide(10, 5));
    }
}
