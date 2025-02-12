package JobListing;

public class Job {
    private int id;
    private String title;
    private String company;
    private String type;
    private String location;
    private String responsibilities;
    private String requirements;

    public Job(int id, String title, String company, String type, String location, String responsibilities, String requirements) {
        this.id = id;
        this.title = title;
        this.company = company;
        this.type = type;
        this.location = location;
        this.responsibilities = responsibilities;
        this.requirements = requirements;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getCompany() { return company; }
    public String getType() { return type; }
    public String getLocation() { return location; }
    public String getResponsibilities() { return responsibilities; }
    public String getRequirements() { return requirements; }
}
