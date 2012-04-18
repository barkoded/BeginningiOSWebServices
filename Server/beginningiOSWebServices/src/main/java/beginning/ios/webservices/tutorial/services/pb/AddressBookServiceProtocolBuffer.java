package beginning.ios.webservices.tutorial.services.pb;

import beginning.ios.webservices.tutorial.AddressBookProtos;
import beginning.ios.webservices.tutorial.model.PersonBuilder;
import eu.barkode.jaxrs.MediaTypeUtil;
import org.springframework.stereotype.Service;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("")
@Service
public class AddressBookServiceProtocolBuffer {
    @GET
    @Path("person")
    @Produces(MediaTypeUtil.APPLICATION_PROTOBUF)
    public AddressBookProtos.Person getPerson() {
        return PersonWrapper.encode(PersonBuilder.newPerson());
    }
}