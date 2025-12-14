package server;
import rmi.BankService;
import util.Conn;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class BankServiceImpl extends UnicastRemoteObject implements BankService {

    public BankServiceImpl() throws RemoteException {
        super();
    }
 
    
    private String generateSSN() {
        return String.valueOf((long)(Math.random() * 9_000_000_000L) + 1_000_000_000L);
    }

    
    
    @Override
    public String signupStepOne(String name, String dob,String gender, String email, String marital,String address, String city, String state, String zip)
            throws RemoteException {
    	
    	String  ssn = generateSSN();
       //  ssn = UUID.randomUUID().toString();


       try(Connection conn = Conn.getConnection()) {
            String query = "INSERT INTO Customer(ssn,name, dob, gender, email, mariatal, address, city, state, zip) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, ssn);
            ps.setString(2, name);
            ps.setString(3, dob);
            ps.setString(4, gender);
            ps.setString(5, email);
            ps.setString(6, marital);
            ps.setString(7, address);
            ps.setString(8, city);
            ps.setString(9, state);
            ps.setString(10, zip);

            int rows = ps.executeUpdate(); //exécute la requête d’insertion.
            ps.close();
            System.out.println("[SIGNUP STEP 1] Success for SSN: " + ssn);
            return ssn;
        } catch (Exception e) {
        	System.out.println("[SIGNUP STEP 1] Error: " + e.getMessage());
        	 e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean signupStepTwo(String ssn, String passportNo, String race,
        String category, String income, String education,
        String occupation, String seniorCitizen, String existAcnt
    ) throws RemoteException  {

    try(Connection conn = Conn.getConnection()) {

        String query = "UPDATE Customer SET  passportNo=?, race=?, category=?, income=?, education=?, occupation=?, seniorCitizen=?, existAcnt=? WHERE ssn=?";
        
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, passportNo);
        ps.setString(2, race);
        ps.setString(3, category);
        ps.setString(4, income);
        ps.setString(5, education);
        ps.setString(6, occupation);
        ps.setString(7, seniorCitizen);
        ps.setString(8, existAcnt);
        ps.setString(9, ssn);

        int rows = ps.executeUpdate();
        ps.close();
        System.out.println("[SIGNUP STEP 2] Success for SSN: " + ssn);
        return true;
    } catch (Exception e) {
        System.out.println("[SIGNUP STEP 2] Error for SSN " + ssn + ": " + e.getMessage());
        e.printStackTrace();
        return false;
    }
    }

    
    
    
    
    @Override
    public List<String> getAgencies() throws RemoteException {
        List<String> agencies = new ArrayList<>();
        try (Connection conn = Conn.getConnection()) {
            String query = "SELECT agenceId, nameAgence FROM agence";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("agenceId");
                String name = rs.getString("nameAgence");
                agencies.add(id + " - " + name); 
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return agencies;
    }

    
    
    
    
    @Override
    public boolean signupThree(
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
        
    ) throws RemoteException {
        try (Connection conn = util.Conn.getConnection()) {
        	// 1️⃣ Créer le compte dans Accounts 
        	String query1 = "INSERT INTO accounts(ssn, type, balance, atmCard, chequeBook, internetBanking, mobileBanking, eStatement, emailSMS, agenceId) VALUES (?, ?, ?, ?, ?,?,?,?,?,?)"; 
        	PreparedStatement ps1 = conn.prepareStatement(query1, PreparedStatement.RETURN_GENERATED_KEYS); 
        	ps1.setString(1, ssn); 
        	ps1.setString(2, type);
        	ps1.setInt(3, 0); // balance initial 
        	ps1.setString(4, atmCard);
        	ps1.setString(5, chequeBook); 
        	ps1.setString(6, internetBanking);
        	ps1.setString(7, mobileBanking);
        	ps1.setString(8, eStatement); 
        	ps1.setString(9, emailSMS);        	
        	ps1.setInt(10, agenceId); 
        	
        	ps1.executeUpdate(); 
        	
        	 // Récupérer account_number
        	ResultSet rs = ps1.getGeneratedKeys();
        	int accountNumber = 0; 
        	if (rs.next()) {
        		accountNumber = rs.getInt(1);
        	} rs.close(); 
        	ps1.close();
        	
  
        	//Créer la carte liée au compte 
        	String query2 = "INSERT INTO card(cardNumber, pin, accountNumber, status) VALUES (?, ?, ?, ?)"; 
        	PreparedStatement ps2 = conn.prepareStatement(query2); 
        	ps2.setString(1, cardNumber); 
        	ps2.setString(2, pin); 
        	ps2.setInt(3, accountNumber);
        	ps2.setString(4, "ACTIVE"); 
        	ps2.executeUpdate(); 
        	ps2.close();

        
        	//Ajouter les informations de login 
        	String query3 = "INSERT INTO login(ssn, cardNumber, pin) VALUES (?, ?, ?)"; 
        	PreparedStatement ps3 = conn.prepareStatement(query3);
        	ps3.setString(1, ssn);
        	ps3.setString(2, cardNumber); 
        	ps3.setString(3, pin);
        	ps3.executeUpdate(); 
        	ps3.close(); 
        	conn.close();
        	
        	
            System.out.println("[SIGNUP STEP 3] Account, card, and login created successfully for SSN: " + ssn);
        	return true;

        } catch (Exception e) {
            System.out.println("[SIGNUP STEP 3] Error for SSN " + ssn + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    
    @Override
    public String login(String cardNumber, String pin , int atmId) throws RemoteException {
        String ssn = null;

        try (Connection conn = Conn.getConnection()) { //Appelle la méthode Conn.getConnection()
        	
        	// Vérifier ATM
            PreparedStatement p = conn.prepareStatement(
                "SELECT * FROM atm WHERE atmId = ?"
            );
            p.setInt(1, atmId);

            if (!p.executeQuery().next()) {
                return null; // ATM inconnue
            }
            System.out.println("Connexion depuis ATM " + atmId);
            
            // Préparation de la requête SQL avec paramètres pour sécuriser contre les injections SQL
            String sql = "SELECT a.ssn FROM card c JOIN accounts a ON c.accountNumber = a.accountNumber WHERE c.cardNumber = ? AND c.pin = ?";
            // créer l’objet qui enverra la requête à MySQL
            PreparedStatement ps = conn.prepareStatement(sql);
            // Remplacement du premier paramètre par le cardNumber fourni
            ps.setString(1, cardNumber);
            // Remplacement du second paramètre par le pin fourni
            ps.setString(2, pin);
            ResultSet rs = ps.executeQuery();
            
           
           // Si un enregistrement est trouvé on retourne le ssn correspondant
            if(rs.next()) { 
            	ssn = rs.getString("ssn");  // Login réussi
                System.out.println("[LOGIN] Success for card: " + cardNumber + ", SSN: " + ssn);
              } else {
                System.out.println("[LOGIN] Failed for card: " + cardNumber + " (wrong PIN or card)");
              }
            
            //fermer le ResultSet et le PreparedStatement pour libérer les ressources
            rs.close();
            ps.close();
            
        } catch (Exception e) {
            System.out.println("Login error: " + e.getMessage());
            e.printStackTrace();
            throw new RemoteException("Database error in login()", e);
        }
        return ssn; // null si user n'a pas trouvé
    }
    
    
    @Override
    public double getBalance(String cardNumber) throws RemoteException {
        try (Connection conn = Conn.getConnection()) {
        	//récupère le solde du compte lié à une carte bancaire.
            String sql = "SELECT a.balance FROM accounts a JOIN card c ON a.accountNumber = c.accountNumber WHERE c.cardNumber=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,cardNumber);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
              double balance=  rs.getDouble("balance");
              System.out.println("[GET BALANCE] Balance for card " + cardNumber + ": " + balance);
              return balance;
            }else {
                System.out.println("[GET BALANCE] Card not found: " + cardNumber);
                return -1; // carte non trouvée
            }
        } catch(Exception e) {
            System.out.println("[GET BALANCE] Error for card " + cardNumber + ": " + e.getMessage());
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public boolean deposit(String cardNumber, double amount,int atmId) throws RemoteException {
        try (Connection conn = Conn.getConnection()) {
            conn.setAutoCommit(false);
            //Récupérer le numéro de compte associé au numero de carte
            String sqlAcc = "SELECT a.accountNumber, a.balance FROM accounts a JOIN card c ON a.accountNumber = c.accountNumber WHERE c.cardNumber=? FOR UPDATE";
            PreparedStatement psAcc = conn.prepareStatement(sqlAcc);
            psAcc.setString(1,cardNumber);
            ResultSet rs = psAcc.executeQuery();

            if (!rs.next()) {
                conn.rollback();
                System.out.println("[DEPOSIT] Card not found: " + cardNumber);
                return false;
            }

            int accNumber = rs.getInt("accountNumber");
            double newBalance = rs.getDouble("balance") + amount;
            
            // Mettre à jour le solde
            PreparedStatement psUpd = conn.prepareStatement(
                "UPDATE accounts SET balance=? WHERE accountNumber=?"
            );
            psUpd.setDouble(1, newBalance);
            psUpd.setInt(2, accNumber);
            psUpd.executeUpdate();

            // Enregistrer la transaction
            PreparedStatement psIns = conn.prepareStatement(
                "INSERT INTO transactions (accountNumber, type, amount, date,details, atmId) VALUES (?,?,?,NOW(),?,?)"
            );
            psIns.setInt(1, accNumber);
            psIns.setString(2, "Deposit");
            psIns.setDouble(3, amount);
            psIns.setString(4, "Cash deposit");
            psIns.setInt(5, atmId);

            psIns.executeUpdate();

            conn.commit();
            System.out.println("[DEPOSIT] Deposit successful. ATM :" +atmId+ " |  Account: " + accNumber+ "  | Card: " +cardNumber + "| Ammount: " +amount);
            return true;

        } catch (Exception e) {
            System.out.println("[DEPOSIT] Error for card " + cardNumber + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    @Override
    public int withdraw(String cardNumber, double amount, String pin, int atmId) throws RemoteException {
        try (Connection conn = Conn.getConnection()) {
            conn.setAutoCommit(false);

            // Vérifier PIN
            PreparedStatement psPin = conn.prepareStatement("SELECT * FROM card WHERE cardNumber=? AND pin=?");
            psPin.setString(1, cardNumber);
            psPin.setString(2, pin);
            if (!psPin.executeQuery().next()) {
                conn.rollback();
                System.out.println("[WITHDRAW] Incorrect PIN for card: " + cardNumber+ "| ATM: " +atmId);
                return 1; // PIN incorrect
            }
          
         // Récupérer le numéro de compte
            PreparedStatement psAcc = conn.prepareStatement(
            		"SELECT a.accountNumber, a.balance FROM accounts a JOIN card c ON a.accountNumber = c.accountNumber WHERE c.cardNumber=? FOR UPDATE"
            );
            psAcc.setString(1, cardNumber);
            ResultSet rs = psAcc.executeQuery();

            if (!rs.next()) {
                conn.rollback();
                System.out.println("[WITHDRAW] Account not found for card: " + cardNumber);

                return 3;
            }

            // Vérifier solde
            int accNumber = rs.getInt("accountNumber");
            double balance = rs.getDouble("balance");

            if (balance < amount) {
                conn.rollback();
                System.out.println("[WITHDRAW] Insufficient balance for account: " + accNumber);
                return 2; // solde insuffisant
            }
            
            // Débiter le compte
            balance -= amount;
            PreparedStatement psUpd = conn.prepareStatement("UPDATE accounts SET balance=? WHERE accountNumber=?");
            psUpd.setDouble(1, balance);
            psUpd.setInt(2, accNumber);
            psUpd.executeUpdate();

            // Ajouter transaction
            PreparedStatement psIns = conn.prepareStatement("INSERT INTO transactions(accountNumber, amount, type,date, details, atmId) VALUES(?,?,?,NOW(),?,?)");
            psIns.setInt(1, accNumber);
            psIns.setDouble(2, amount);
            psIns.setString(3, "Withdraw");
            psIns.setString(4, "Cash withdrawal");
            psIns.setInt(5, atmId);

            

            psIns.executeUpdate();
            // commit valide toute opèration
            conn.commit();
            System.out.println("[WITHDRAW] Withdrawal successful. ATM: " + atmId+ " | Card: " +cardNumber+ " | Account: " + accNumber + " | Amount: " + amount );

            return 0; // succès

        } catch (Exception e) {
            System.out.println("[WITHDRAW] Error for card " + cardNumber + ": " + e.getMessage());
            e.printStackTrace();
            return 3; // erreur serveur
        }
    }

    
    
    @Override
    public boolean fastCash(String cardNumber, int amount,int atmId) throws RemoteException {
        try (Connection conn = Conn.getConnection()) {

            //Récupérer le compte associé à la carte
            String sql1 = "SELECT a.accountNumber, a.balance FROM accounts a " +
                          "JOIN card c ON a.accountNumber = c.accountNumber " +
                          "WHERE c.cardNumber = ?";
            PreparedStatement ps = conn.prepareStatement(sql1);
            ps.setString(1, cardNumber);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                System.out.println("[FAST CASH] Account not found for card: " + cardNumber);
                return false;
            }

            String accountNumber = rs.getString("accountNumber");
            double balance = rs.getDouble("balance");

            //Vérifier solde
            if (balance < amount) {
                System.out.println("[FAST CASH] Insufficient balance for account: " + accountNumber);
                return false;
            }

            // Enregistrer transaction
            String sql2 = "INSERT INTO transactions(accountNumber, type, amount, date, details, atmId) " +
                          "VALUES(?, ?, ?, NOW(), ?,?)";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ps2.setString(1, accountNumber);
            ps2.setString(2, "fastCash");
            ps2.setInt(3, amount);
            ps2.setString(4, "ATM Fast Cash");   
            ps2.setInt(5, atmId);

            ps2.executeUpdate();

            //Mettre à jour solde
            String sql3 = "UPDATE accounts SET balance = balance - ? WHERE accountNumber = ?";
            PreparedStatement ps3 = conn.prepareStatement(sql3);
            ps3.setInt(1, amount);
            ps3.setString(2, accountNumber);
            ps3.executeUpdate();
            System.out.println("[FAST CASH] Fast cash successful.  \" | ATM: " + atmId + " | Card: " + cardNumber + " | Account: " + accountNumber + " | Ammount: " + amount);
           
            return true;
            
        } catch (Exception e) {
            System.out.println("[FAST CASH] Error for card " + cardNumber + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    
    @Override
    public boolean changePin(String cardNumber, String oldPin, String newPin) throws RemoteException {
        try (Connection conn = Conn.getConnection()) {
            conn.setAutoCommit(false);


            // Vérifier si l'ancien PIN est correct
            String checkQuery = "SELECT pin FROM login WHERE cardNumber = ?";
            PreparedStatement ps = conn.prepareStatement(checkQuery);
            ps.setString(1, cardNumber);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                System.out.println("[CHANGE PIN] Card not found: " + cardNumber);
            	return false;
            }
            String realOldPin = rs.getString("pin");
            if (!realOldPin.equals(oldPin)) {
                System.out.println("[CHANGE PIN] Incorrect old PIN for card: " + cardNumber);
                return false;
            }

         // Mettre à jour le pin dans card
            String updateCard = "UPDATE card SET pin = ? WHERE cardNumber = ?";
            PreparedStatement psCard = conn.prepareStatement(updateCard);
            psCard.setString(1, newPin);
            psCard.setString(2, cardNumber);
            psCard.executeUpdate();

            // Puis mettre à jour login
            String updateLogin = "UPDATE login SET pin = ? WHERE cardNumber = ?";
            ps = conn.prepareStatement(updateLogin);
            ps.setString(1, newPin);
            ps.setString(2, cardNumber);
            ps.executeUpdate();


            conn.commit();
            conn.close();
            System.out.println("[CHANGE PIN] PIN changed successfully for card: " + cardNumber);
            return true;
        } catch (Exception e) {
            System.out.println("[CHANGE PIN] Error for card " + cardNumber + ": " + e.getMessage());

            e.printStackTrace();
            return false;
        }
    }


    
    @Override
    public String[] getMiniStatement(String cardNumber, int atmId) throws RemoteException {
        ArrayList<String> resultList = new ArrayList<>();
        try (Connection conn = Conn.getConnection()) {

            Statement stmt = conn.createStatement();

            // Nom du client + agence du compte
            ResultSet rs = stmt.executeQuery(
                "SELECT c.ssn, c.name, ag.nameAgence AS clientAgence " +
                "FROM Customer c " +
                "JOIN login l ON c.ssn = l.ssn " +
                "JOIN accounts a ON c.ssn = a.ssn " +
                "JOIN agence ag ON a.agenceId = ag.agenceId " +
                "WHERE l.cardNumber='" + cardNumber + "'"
            );

            String name = "", clientAgence = "";
            
            if (rs.next()) {
                name = rs.getString("name");
                clientAgence = rs.getString("clientAgence");
            }


            // Ajouter infos à la liste (index 0=banque, 1=ATM agence, 2=client agence, 3=nom client)
            resultList.add("MyBank");    // banque
            resultList.add(clientAgence);   // agence du compte
            resultList.add(name);        // nom du client

            // Carte masquée
            rs = stmt.executeQuery("SELECT cardNumber FROM Login WHERE cardNumber='" + cardNumber + "'");
            
            if (rs.next()) {
                String cNum = rs.getString("cardNumber");
                String masked = cNum.substring(0, 4) + "-XXXX-XXXX-" + cNum.substring(12);
                resultList.add(masked);
            }

            // Transactions (10 dernières)
            rs = stmt.executeQuery(
                "SELECT t.type, t.date, t.amount " +
                "FROM transactions t " +
                "JOIN accounts a ON t.accountNumber = a.accountNumber " +
                "JOIN login l ON a.ssn = l.ssn " +
                "WHERE l.cardNumber = '" + cardNumber + "' " +
                "ORDER BY t.date DESC " +
                "LIMIT 10"
            );
            while (rs.next()) {
                resultList.add(rs.getString("type"));
                resultList.add(rs.getString("date"));
                resultList.add(rs.getString("amount"));
            }

            // Solde
            rs = stmt.executeQuery(
                "SELECT a.balance FROM accounts a JOIN login l ON a.ssn = l.ssn WHERE l.cardNumber='" + cardNumber + "'"
            );
            if (rs.next()) {
                resultList.add(rs.getString("balance"));
            }
            rs.close();
            stmt.close();
            System.out.println("[MINI STATEMENT] ATM ID: " + atmId + " | Card: " + cardNumber);
        } catch (Exception e) {
            System.out.println("[MINI STATEMENT] Error for card " + cardNumber + ": " + e.getMessage());
            e.printStackTrace();
        }

        return resultList.toArray(new String[0]);
    }


    

    @Override
    public String getCustomerName(String cardNumber) throws RemoteException {
        String name = null;
        try {
            Connection conn = Conn.getConnection();
            // Récupérer le SSN à partir du cardNumber
            ResultSet rs1 = conn.createStatement().executeQuery(
                "SELECT ssn FROM login WHERE cardNumber = '" + cardNumber + "'"
            );
            String ssn = null;
            if(rs1.next()) {
                ssn = rs1.getString("ssn");
            }
            rs1.close();

            if(ssn != null) {
                // Récupérer le nom à partir du SSN
                ResultSet rs2 = conn.createStatement().executeQuery(
                    "SELECT name FROM Customer WHERE ssn = '" + ssn + "'"
                );
                if(rs2.next()) {
                    name = rs2.getString("name");
                }
                rs2.close();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    
}
