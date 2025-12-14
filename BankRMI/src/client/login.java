package client;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import rmi.BankService;



public class login extends JFrame implements ActionListener{
	
	JButton login, signup, clear;
	int atmId;
	JTextField cardNoTF;
	JPasswordField pinTF;
	
	public login() {}
	public login(int atmId)
	{	
        this.atmId = atmId;

		//Add Title to the Frame
		setTitle("Automated Teller Machine");
		
		//Removes default layout applied by JFrames
		setLayout(null);
		
		//Adding icon to the Frame
		// mets dossier icons as  “Use as Source Folder” comme src/ ==> Eclipse  ajoute tous les fichiers dans le classpat
		ImageIcon img1 = new ImageIcon(ClassLoader.getSystemResource("bank.png"));
		Image img2 = img1.getImage().getScaledInstance(180, 180, Image.SCALE_DEFAULT);
		img1 =  new ImageIcon(img2);
		JLabel label = new JLabel(img1);
		label.setBounds(140, 90, 180, 180);
		add(label);
		
		//Adding text fields to the Frame
		JLabel text = new JLabel("Welcome to Apex Trust Bank ATM");
		text.setFont(new Font("Osward", Font.BOLD, 42));
		text.setBounds(340, 170, 500, 40);
		add(text);
		
		JLabel cardNo = new JLabel("Card No.");
		cardNo.setFont(new Font("Raleway", Font.BOLD, 32));
		cardNo.setBounds(250, 320, 150, 40);
		add(cardNo);
		
		cardNoTF = new JTextField();
		cardNoTF.setBounds(410, 320, 300, 40);
		cardNoTF.setFont(new Font("Arial", Font.BOLD, 14));
		add(cardNoTF);
		
		JLabel pin = new JLabel("        PIN");
		pin.setFont(new Font("Raleway", Font.BOLD, 32));
		pin.setBounds(250, 420, 150, 40);
		add(pin);
		
		pinTF = new JPasswordField();
		pinTF.setBounds(410, 420, 300, 40);
		pinTF.setFont(new Font("Arial", Font.BOLD, 14));
		add(pinTF);
		
		login = new JButton("Login");
		login.setBounds(250, 520, 200, 40);
		login.setFont(new Font("Raleway", Font.BOLD, 16));
		login.setBackground(Color.BLACK);
		login.setForeground(Color.WHITE);
		login.addActionListener(this);
		add(login);
		
		clear = new JButton("Clear");
		clear.setBounds(500, 520, 200, 40);
		clear.setFont(new Font("Raleway", Font.BOLD, 16));
		clear.setBackground(Color.BLACK);
		clear.setForeground(Color.WHITE);
		clear.addActionListener(this);
		add(clear);
		
		//boutton signup
		signup = new JButton("Signup"); 
		signup.setBounds(750, 520, 200, 40);
		signup.setFont(new Font("Raleway", Font.BOLD, 16)); 
		signup.setBackground(Color.BLACK); 
		signup.setForeground(Color.WHITE); 
		signup.addActionListener(this); 
		add(signup);
		
		
		//Setting Frame size and location
		setSize(1000, 800);
		setVisible(true);
		setLocation(300, 10);
				
		// Set background for the Frame
		getContentPane().setBackground(Color.WHITE);
		
	}


 
	@Override
	public void actionPerformed(ActionEvent ae)
	{
		if (ae.getSource() == login)
		{
			String ssn = "";
			String cardNumber = cardNoTF.getText();
			if(cardNumber.equals("")) {
				JOptionPane.showMessageDialog(null, "Please enter Card Number!");
				cardNoTF.requestFocus();
				return;
			}
			
			String pin = "" + pinTF.getText();
			if(pin.equals("")) {
				JOptionPane.showMessageDialog(null, "Please enter PIN!");
				pinTF.requestFocus();
				return;
			}
			
			try
			{
				//int atmId =1 ; // ATM physique (lié à une agence)

			    // Connexion au serveur RMI /  cherche le registre RMI en port 1099.
			    Registry registry = LocateRegistry.getRegistry("localhost", 1099);
			    // cherche dans le registre le service  "bankService"
			    BankService service = (BankService) registry.lookup("bankService");
			    //ou combine automatiquement : la connexion au registre la recherche de l'objet
			    // BankService service = (BankService) Naming.lookup("rmi://localhost/bankService");


			    // client appelle la méthode login
			    //Le serveur vérifie les informations dans la base de données.
                //Si le login est correct, le serveur renvoie le SSN de l’utilisateur, sinon null.
			    ssn = service.login(cardNumber, pin,this.atmId );

			    if (ssn != null) {
					setVisible(false);
			       // JOptionPane.showMessageDialog(null, "Login Successful!");
					new Transactions(cardNumber, pin, atmId).setVisible(true);
			        dispose();
			    } else {
			        JOptionPane.showMessageDialog(null, "Incorrect Card Number or PIN!");
			    }
			} catch(Exception e){
			    System.out.println(e);
			    JOptionPane.showMessageDialog(this, "Error connecting to server: " + e.getMessage());

			}

		}
		else if (ae.getSource() == signup)
		{	
			setVisible(false);
			new SignupOne();
		}
		else if (ae.getSource() == clear)
		{
			cardNoTF.setText("");
			pinTF.setText("");
		}
	
	}
	 public static void main(String[] args) {
	        // Lancer 2 ATM avec des IDs différents
	        SwingUtilities.invokeLater(() -> new login(1)); // ATM 1
	        SwingUtilities.invokeLater(() -> new login(2)); // ATM 2
	    }
}
