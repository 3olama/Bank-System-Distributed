package rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

import rmi.BankService;

public interface BankService extends Remote {
	
	
    String login(String cardNumber, String pin, int atmId) throws RemoteException;
    String signupStepOne(
            String name, String dob,
            String gender, String email, String marital,
            String address, String city, String state, String zip
        ) throws RemoteException;
    
    boolean signupStepTwo(
    	   String ssn, String passportNo, String race,
    	    String category, String income, String education,
    	    String occupation, String seniorCitizen, String existAcnt
    	) throws RemoteException;
    
    
    
   // Agence[] getAgencies() throws RemoteException;

    
    boolean signupThree(
            String ssn,
            String type,
            String cardNumber,
            String pin,
            String atmCard,
            String chequeBook,
            String internetBanking,
            String mobileBanking,
            String eStatement,
            String emailSMS,
            int agenceId
        ) throws RemoteException;
    
    
    List<String> getAgencies() throws RemoteException;
    String[] getMiniStatement(String cardNumber , int atmId) throws RemoteException;

    

    double getBalance(String cardNumber) throws RemoteException;
    boolean deposit(String cardNumber, double amount, int atmId) throws RemoteException;
    int withdraw(String cardNumber, double amount, String pin, int atmId) throws RemoteException;
    boolean changePin(String cardNumber, String oldPin, String newPin) throws RemoteException;
    boolean fastCash(String ssn, int amount, int atmId) throws RemoteException;
    String getCustomerName(String cardNumber) throws RemoteException;

    
}
