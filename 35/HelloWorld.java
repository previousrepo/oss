public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello from Docker!");
        System.out.println("Java Version: " + System.getProperty("java.version"));
        System.out.println("OS: " + System.getProperty("os.name"));
        
        // Simple calculation
        int sum = 0;
        for (int i = 1; i <= 10; i++) {
            sum += i;
        }
        System.out.println("Sum of 1 to 10: " + sum);
    }
}
