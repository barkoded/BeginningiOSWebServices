package beginning.ios.webservices.tutorial.services.soap;

import beginning.ios.webservices.tutorial.model.Person;
import beginning.ios.webservices.tutorial.model.PersonBuilder;

import javax.jws.WebService;

@WebService(endpointInterface = "beginning.ios.webservices.tutorial.services.soap.AddressBookService", serviceName = "AddressBookService")
public class AddressBookServiceImpl implements AddressBookService {
    @Override
    public Person getPerson() {
        return PersonBuilder.newPerson();
    }
}