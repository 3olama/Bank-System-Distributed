package client;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import rmi.BankService;

public class MiniStatement extends JFrame implements ActionListener {
	
	String cardNumber,pin;
	JLabel pinL, label, text;
	JButton getStatement, back;
	JPasswordField pinPF;
	public MiniStatement(String cardNumber, String pin)
	{
		setLayout(null);
        this.cardNumber = cardNumber;
		this.pin = pin;


		
		ImageIcon img1 = new ImageIcon(ClassLoader.getSystemResource("atm.jpg"));
		Image img2 = img1.getImage().getScaledInstance(900, 915, Image.SCALE_DEFAULT);
		img1 =  new ImageIcon(img2);
		label = new JLabel(img1);
		label.setBounds(0, 0, 900, 850);
		add(label);
		
		text = new JLabel("Mini Statement:");
		text.setBounds(265, 265, 700, 35);
		text.setFont(new Font("System", Font.BOLD, 18));
		text.setForeground(Color.GREEN);
		label.add(text);
		
		pinL = new JLabel("Enter PIN:");
		pinL.setBounds(185, 350, 180, 25);
		pinL.setFont(new Font("System", Font.BOLD, 16));
		pinL.setForeground(Color.WHITE);
		label.add(pinL);
		
		pinPF = new JPasswordField();
		pinPF.setFont(new Font("System", Font.BOLD, 25));
		pinPF.setBounds(300, 350, 180, 25);
		label.add(pinPF);
		
		getStatement = new JButton("GET STATEMENT");
		getStatement.setBounds(355, 465, 150, 24);
		getStatement.addActionListener(this);
		label.add(getStatement);
		
		back = new JButton("BACK");
		back.setBounds(355, 500, 150, 24);
		back.addActionListener(this);
		label.add(back);
		
		setSize(900, 900);
		setLocation(300, 0);
		setUndecorated(true);
		setVisible(true);
		
	}
	
	@Override
	public void actionPerformed(ActionEvent ae)
	{
		if (ae.getSource() == back) {
			setVisible(false);
			new Transactions(cardNumber, pin).setVisible(true);
		}
		else if(ae.getSource() == getStatement) 
		{
			String testpin = pinPF.getText();
			if(testpin.equals("")) {
				JOptionPane pane = new JOptionPane("PIN is required!");
				JDialog d = pane.createDialog((JFrame)null, "Message");
				d.setLocation(500,350);
			    d.setVisible(true);
			    
			    pinPF.requestFocus();
				return;
			}
			else if (!testpin.equals(pin)) 
			{
				JOptionPane pane = new JOptionPane("Invalid PIN!");
				JDialog d = pane.createDialog((JFrame)null, "Message");
				d.setLocation(500,350);
			    d.setVisible(true);
			    
			    pinPF.setText("");
			    pinPF.requestFocus();
				return;				
			}
			else {
				// Masquer le PIN et le bouton
				pinL.setText("Please collect your mini statement:");
				pinL.setBounds(200, 340, 500, 25);
				pinPF.hide();
				getStatement.hide();

				// Appel RMI pour obtenir le mini statement
                try {
                    Registry registry = LocateRegistry.getRegistry("localhost", 1099);
                    BankService service = (BankService) registry.lookup("bankService");
                    String[] miniStatementData = service.getMiniStatement(cardNumber); // Récupère un tableau ou JSON
                    new MiniStatementResult(cardNumber, miniStatementData);
                } catch(Exception e){
                    e.printStackTrace();
                }
        }
    }
   }

    public static void main(String[] args) {
        new MiniStatement("45","4525");
    }
}