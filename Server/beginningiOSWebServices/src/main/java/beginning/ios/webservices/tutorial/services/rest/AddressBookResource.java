package beginning.ios.webservices.tutorial.services.rest;

import beginning.ios.webservices.tutorial.model.Person;
import beginning.ios.webservices.tutorial.model.PersonBuilder;
import org.apache.cxf.annotations.GZIP;
import org.springframework.stereotype.Service;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("")
@Service
@GZIP
public class AddressBookResource {
    @GET
    @Path("person")
    @Produces(MediaType.APPLICATION_JSON)
    public Person getPerson() {
        return PersonBuilder.newPerson();
    }
}