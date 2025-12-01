package client;

import java.rmi.Naming;

public class testClient {
    public static void main(String[] args) {
        try {
            String[] names = Naming.list("rmi://localhost/");
            for(String n : names){
                System.out.println("Service bound: " + n);
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
