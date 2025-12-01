package rmi;

import server.BankServiceImpl;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class TestRMI {
    public static void main(String[] args) {
        try {
            BankServiceImpl service = new BankServiceImpl(); // déjà exporté via super()

            Registry registry = LocateRegistry.createRegistry(2099); // port RMI
            registry.rebind("bankService", service); // pas besoin de stub exporté manuellement

            System.out.println("Serveur RMI prêt !");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
