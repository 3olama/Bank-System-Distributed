package client;

import java.awt.Color;
import java.awt.Font;
import javax.swing.*;

public class MiniStatementResult extends JFrame {

    public MiniStatementResult(String cardNumber, String[] miniStatementData) {
    
        setTitle("Mini Statement");
        setLayout(null);
        
        JLabel bankJL = new JLabel("Bank: " + miniStatementData[0]);
        bankJL.setFont(new Font("Calibri", Font.BOLD, 20));
        bankJL.setBounds(160, 30, 200, 25);
        add(bankJL);
        
        // Nom de l'agence
        JLabel agencyJL = new JLabel("Agency: " + miniStatementData[1]);
        agencyJL.setFont(new Font("Calibri", Font.BOLD, 15));
        agencyJL.setBounds(20, 50, 300, 20);
        add(agencyJL);
        
        // Nom du client récupéré via RMI
        JLabel nameJL = new JLabel("Name: " + miniStatementData[2]); // exemple: miniStatementData[0] = nom
        nameJL.setFont(new Font("Calibri", Font.BOLD, 15));
        nameJL.setBounds(20, 90, 300, 20);
        add(nameJL);
        
        // Numéro de carte masqué
        JLabel cardJL = new JLabel("Card Number: " + miniStatementData[3]); // miniStatementData[1] = carte masquée
        cardJL.setFont(new Font("Calibri", Font.BOLD, 15));
        cardJL.setBounds(20, 110, 300, 20);
        add(cardJL);
        
        // Mini statement (type, date, montant)
        JLabel mini = new JLabel();
        mini.setBounds(20, 140, 400, 300);
        add(mini);
        StringBuilder html = new StringBuilder("<html><table border='1' ><tr><th>Type</th><th>Date</th><th>Amount</th></tr>");
        for(int i=4; i+2 <miniStatementData.length -1 ; i+=3) { // 3 colonnes par ligne
            html.append("<tr><td>").append(miniStatementData[i])
                .append("</td><td>").append(miniStatementData[i+1])
                .append("</td><td>").append(miniStatementData[i+2])
                .append("</td></tr>");
        }
        html.append("</table></html>");
        mini.setText(html.toString());
        
        // Balance
        JLabel balanceJL = new JLabel("Your account balance is: " + miniStatementData[miniStatementData.length-1] + "$"); // dernier élément = balance
        balanceJL.setFont(new Font("Calibri", Font.BOLD, 15));
        balanceJL.setBounds(20, 450, 400, 20);
        add(balanceJL);
        
        setSize(400, 600);
        setLocation(800, 150);
        getContentPane().setBackground(Color.WHITE);
        setVisible(true);
    }
}