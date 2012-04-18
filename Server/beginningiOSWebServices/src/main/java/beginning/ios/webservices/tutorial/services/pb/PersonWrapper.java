package beginning.ios.webservices.tutorial.services.pb;

import beginning.ios.webservices.tutorial.AddressBookProtos;
import beginning.ios.webservices.tutorial.model.Person;
import beginning.ios.webservices.tutorial.model.PhoneType;

public class PersonWrapper {

    public static AddressBookProtos.Person encode(Person person) {
        return AddressBookProtos.Person.newBuilder()
                .setId(person.getId())
                .setName(person.getName())
                .setEmail(person.getEmail())
                .addPhone(AddressBookProtos.Person.PhoneNumber.newBuilder()
                        .setNumber(person.getPhoneNumber().getPhoneNumber())
                        .setType(getPhoneType(person.getPhoneNumber().getType()))
                        .build())
                .build();
    }

    private static AddressBookProtos.Person.PhoneType getPhoneType(PhoneType phoneType) {
        if (phoneType.value() == PhoneType.HOME.value()) {
            return AddressBookProtos.Person.PhoneType.HOME;
        } else if (phoneType.value() == PhoneType.WORK.value()) {
            return AddressBookProtos.Person.PhoneType.WORK;
        } else if (phoneType.value() == PhoneType.MOBILE.value()) {
            return AddressBookProtos.Person.PhoneType.MOBILE;
        }
        return null;
    }
}