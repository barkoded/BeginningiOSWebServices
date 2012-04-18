package beginning.ios.webservices.tutorial.services.plist;

import beginning.ios.webservices.tutorial.model.PersonBuilder;
import com.dd.plist.NSObject;
import eu.barkode.jaxrs.MediaTypeUtil;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("")
//@Service
public class AddressBookServiceBinaryPList {
    @GET
    @Path("person")
    @Produces(MediaTypeUtil.APPLICATION_PLIST_BINARY)
    public NSObject getPerson() {
        return PersonWrapper.encode(PersonBuilder.newPerson());
    }

}