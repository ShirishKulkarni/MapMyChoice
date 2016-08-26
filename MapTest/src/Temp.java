import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;


public class Temp {

	public static void main(String[] args)
	{
		
		try {
		    URL url = new URL("http://media.mongodb.org/zips.json");
		    URLConnection connection = url.openConnection();
		    System.out.println(connection);
		    BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
		    String line = null;
		    

		    while ((line = reader.readLine()) != null) {
		       System.out.println(line);
		    }
		    reader.close();

		} catch (MalformedURLException e) {
		   e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
