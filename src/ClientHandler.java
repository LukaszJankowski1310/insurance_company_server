

import db.DataBase;
import db.DbConstants;
import db.models.UserOffer;

import java.io.*;
import java.net.Socket;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClientHandler implements Runnable{
    private BufferedReader bufferedReader;
    private BufferedWriter bufferedWriter;

    private Socket clientSocket;

    private final DataBase dataBase;

    public ClientHandler(Socket clientSocket)  {
        this.clientSocket = clientSocket;
        dataBase = new DataBase(DbConstants.URL, DbConstants.USER_NAME, DbConstants.PASSWORD);
        try {
            bufferedWriter = new BufferedWriter(new OutputStreamWriter(this.clientSocket.getOutputStream()));
            bufferedReader = new BufferedReader(new InputStreamReader(this.clientSocket.getInputStream()));
        } catch (IOException e) {
            e.printStackTrace();
            closeAll(clientSocket, bufferedReader, bufferedWriter);
        }

    }

    @Override
    public void run() {
        String clientMessage;
        try {
            clientMessage = bufferedReader.readLine();
            int userId = Integer.parseInt(clientMessage);
            System.out.println("User: " + userId);
            if (dataBase.checkIfUserExists(userId)) {
                ArrayList<UserOffer> userOffers = dataBase.getUserOffers(userId);
                writeMessage(String.valueOf(userOffers.size()));
                for (UserOffer userOffer : userOffers) {
                    String message = userOffer.prepareUserOfferToSend();
                    writeMessage(message);
                }
                System.out.println("Data send");
            } else {
                writeMessage("-1");
                System.out.println("Client asks for user who doesn't exist");
            }

        } catch (IOException | SQLException e) {
            e.printStackTrace();
            closeAll(clientSocket, bufferedReader, bufferedWriter);
        } catch (NumberFormatException e) {
            writeMessage("Incorrect data format");
        }

    }


    private void closeAll(Socket clientSocket, BufferedReader bufferedReader, BufferedWriter bufferedWriter)
    {
        try {
            clientSocket.close();
            bufferedReader.close();
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void writeMessage(String message) {
        try {
            bufferedWriter.write(message);
            bufferedWriter.newLine();
            bufferedWriter.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
