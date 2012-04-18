package beginning.ios.webservices.tutorial.model;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlEnumValue;
import javax.xml.bind.annotation.XmlType;

@XmlType(name = "phoneType")
@XmlEnum
public enum PhoneType {
    @XmlEnumValue("0")
    MOBILE(0),
    @XmlEnumValue("1")
    HOME(1),
    @XmlEnumValue("2")
    WORK(2);

    private final int value;

    PhoneType(int v) {
        value = v;
    }

    public int value() {
        return value;
    }

    public static PhoneType fromValue(int v) {
        for (PhoneType c : PhoneType.values()) {
            if (c.value == v) {
                return c;
            }
        }
        throw new IllegalArgumentException(String.valueOf(v));
    }
}
