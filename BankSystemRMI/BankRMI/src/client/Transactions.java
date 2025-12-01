package client;

import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

import rmi.BankService;
import util.Conn;

public class Transactions extends JFrame implements ActionListener {

    JButton deposit, withdraw, fastCash, miniStatement, pinChange, balance, exit;
    String ssn, pin, cardNumber;

    public Transactions(String cardNumber, String pin) {
        setLayout(null);

        this.pin = pin;
        this.cardNumber=cardNumber;
        String name = "";

        try {
            Registry registry = LocateRegistry.getRegistry("localhost", 1099);
            BankService service = (BankService) registry.lookup("bankService");

            // Appel RMI pour récupérer le nom
            name = service.getCustomerName(cardNumber);

        } catch(Exception e){
            e.printStackTrace();
        }

        ImageIcon img1 = new ImageIcon(ClassLoader.getSystemResource("atm.jpg"));
        Image img2 = img1.getImage().getScaledInstance(900, 915, Image.SCALE_DEFAULT);
        img1 = new ImageIcon(img2);

        JLabel label = new JLabel(img1);
        label.setBounds(0, 0, 900, 850);
        add(label);

        JLabel nameJL = new JLabel("Welcome " + name);
        nameJL.setBounds(225, 300, 700, 35);
        nameJL.setFont(new Font("System", Font.BOLD, 18));
        nameJL.setForeground(Color.GREEN);
        label.add(nameJL);

        JLabel text = new JLabel("Please select your transaction");
        text.setBounds(205, 330, 700, 35);
        text.setFont(new Font("System", Font.BOLD, 18));
        text.setForeground(Color.GREEN);
        label.add(text);

        deposit = new JButton("DEPOSIT");
        deposit.setBounds(170, 395, 150, 24);
        deposit.addActionListener(this);
        label.add(deposit);

        withdraw = new JButton("WITHDRAW");
        withdraw.setBounds(355, 395, 150, 24);
        withdraw.addActionListener(this);
        label.add(withdraw);

        fastCash = new JButton("FAST CASH");
        fastCash.setBounds(170, 430, 150, 24);
        fastCash.addActionListener(this);
        label.add(fastCash);

        pinChange = new JButton("PIN CHANGE");
        pinChange.setBounds(355, 430, 150, 24);
        pinChange.addActionListener(this);
        label.add(pinChange);

        miniStatement = new JButton("MINI STATEMENT");
        miniStatement.setBounds(170, 465, 150, 24);
        miniStatement.addActionListener(this);
        label.add(miniStatement);

        balance = new JButton("CHECK BALANCE");
        balance.setBounds(355, 465, 150, 24);
        balance.addActionListener(this);
        label.add(balance);

        exit = new JButton("EXIT");
        exit.setBounds(355, 500, 150, 24);
        exit.addActionListener(this);
        label.add(exit);

        setSize(900, 900);
        setLocation(300, 0);
        setUndecorated(true);
        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent ae) {
        if (ae.getSource() == deposit) {
            setVisible(false);
            new deposit(cardNumber, pin);
        } else if (ae.getSource() == withdraw) {
            setVisible(false);
            new Withdraw(cardNumber, pin);
        } else if (ae.getSource() == balance) {
            setVisible(false);
			new CheckBalance(cardNumber, pin);
        } 
        else if (ae.getSource() == pinChange) {
            setVisible(false);
			new PinChange(cardNumber, pin);
        }
        else if (ae.getSource() == fastCash) {
            setVisible(false);
			new  FastCash(cardNumber, pin);
        }
        else if (ae.getSource() == miniStatement) {
			setVisible(false);
			new MiniStatement(cardNumber,pin);
		}
	   else if (ae.getSource() == exit) {
            System.exit(0);
        }
        
        
    }

    public static void main(String args[]) {
        new Transactions("1234567890", "2968"); // exemple
    }
}
