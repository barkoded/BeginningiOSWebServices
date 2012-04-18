package beginning.ios.webservices.tutorial.services.soap;

import beginning.ios.webservices.tutorial.model.Person;

import javax.jws.WebService;

@WebService
public interface AddressBookService {
    public Person getPerson();
}
