package eu.barkode.jaxrs;

import javax.ws.rs.core.MediaType;

/**
 */
public class MediaTypeUtil {

    /**
     * "application/x-plist"
     */
    public final static String APPLICATION_PLIST_BINARY = "application/x-plist";
    /**
     * "application/x-plist"
     */
    public final static MediaType APPLICATION_PLIST_BINARY_TYPE = new MediaType("application", "x-plist");

    /**
     * "application/x-plist"
     */
    public final static String APPLICATION_PROTOBUF = "application/x-protobuf";
    /**
     * "application/x-plist"
     */
    public final static MediaType APPLICATION_PROTOBUF_TYPE = new MediaType("application", "x-protobuf");

}
