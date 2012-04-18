package beginning.ios.webservices.tutorial.services.plist;

import beginning.ios.webservices.tutorial.model.Person;
import com.dd.plist.NSDictionary;
import com.dd.plist.NSObject;

public class PersonWrapper {

    public static NSObject encode(Person person) {
        NSDictionary response = new NSDictionary();
        response.put("email", person.getEmail());
        response.put("name", person.getName());
        response.put("id", person.getId());

        NSDictionary phoneDic = new NSDictionary();
        phoneDic.put("number", person.getPhoneNumber().getPhoneNumber());
        phoneDic.put("type", person.getPhoneNumber().getType().value());
        response.put("phone", phoneDic);

        return response;
    }

}
