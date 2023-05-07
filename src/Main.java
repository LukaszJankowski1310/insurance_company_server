import java.io.IOException;
import java.net.ServerSocket;

import static java.lang.System.exit;

public class Main {

    public static void main(String[] args) {
        if (args.length < 1) exit(-1);
        int port = Integer.parseInt(args[0]);
        try {
            Server server = new Server(new ServerSocket(port));
            server.runServer();



        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}