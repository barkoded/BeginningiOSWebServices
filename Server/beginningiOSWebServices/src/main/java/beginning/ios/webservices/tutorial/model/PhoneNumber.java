package beginning.ios.webservices.tutorial.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "phoneNumber")
@XmlAccessorType(XmlAccessType.FIELD)
public class PhoneNumber {
    public String phoneNumber;
    @XmlElement
    private PhoneType type;

    public PhoneNumber() {
    }

    public PhoneNumber(String phoneNumber) {
        this(phoneNumber, PhoneType.HOME);
    }

    public PhoneNumber(String phoneNumber, PhoneType type) {
        this.phoneNumber = phoneNumber;
        this.type = type;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public PhoneType getType() {
        return type;
    }
}
