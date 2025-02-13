package JobListing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JobDAO {
    public static List<Job> getAllJobs() {
        List<Job> jobList = new ArrayList<>();
        String jdbcURL = "jdbc:mysql://localhost:3306/carrentaldb";
        String dbUser = "root";
        String dbPassword = "";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "SELECT * FROM job_listings";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String company = resultSet.getString("company");
                String type = resultSet.getString("type");
                String location = resultSet.getString("location");
                String responsibilities = resultSet.getString("responsibilities");
                String requirements = resultSet.getString("requirements");
                jobList.add(new Job(id, title, company, type, location, responsibilities, requirements));
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobList;
    }
}