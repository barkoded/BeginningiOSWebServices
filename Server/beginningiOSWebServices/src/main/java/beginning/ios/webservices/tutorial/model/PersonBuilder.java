package beginning.ios.webservices.tutorial.model;

public class PersonBuilder {
    public static Person newPerson() {
        return new Person(1024, "James Public", "jp@internet.com", new PhoneNumber("415-555-1212", PhoneType.MOBILE));
    }
}