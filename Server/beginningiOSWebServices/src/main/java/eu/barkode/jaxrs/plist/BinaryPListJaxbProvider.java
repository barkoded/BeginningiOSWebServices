package eu.barkode.jaxrs.plist;

import com.dd.plist.BinaryPropertyListParser;
import com.dd.plist.BinaryPropertyListWriter;
import com.dd.plist.NSObject;
import eu.barkode.jaxrs.MediaTypeUtil;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.ext.MessageBodyReader;
import javax.ws.rs.ext.MessageBodyWriter;
import javax.ws.rs.ext.Provider;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;

@Provider
@Consumes(MediaTypeUtil.APPLICATION_PLIST_BINARY)
@Produces(MediaTypeUtil.APPLICATION_PLIST_BINARY)
public class BinaryPListJaxbProvider implements MessageBodyReader<NSObject>, MessageBodyWriter<NSObject> {

    public BinaryPListJaxbProvider() {
        super();
    }

    @Override
    public boolean isReadable(Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType) {
        return NSObject.class.isAssignableFrom(type);
    }

    @Override
    public NSObject readFrom(Class<NSObject> type, Type genericType, Annotation[] annotations, MediaType mediaType, MultivaluedMap<String, String> httpHeaders, InputStream entityStream) throws IOException, WebApplicationException {
        try {
            return BinaryPropertyListParser.parse(entityStream);
        } catch (Exception e) {
            throw new IOException(e);
        }
    }

    @Override
    public boolean isWriteable(Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType) {
        return NSObject.class.isAssignableFrom(type);
    }

    @Override
    public long getSize(NSObject nsObject, Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            BinaryPropertyListWriter.write(baos, nsObject);
        } catch (Exception e) {

        } finally {
            try {
                baos.close();
            } catch (IOException e) {
                // Do nothing
            }
        }
        byte[] bytes = baos.toByteArray();
        return bytes.length;
    }

    @Override
    public void writeTo(NSObject nsObject, Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType, MultivaluedMap<String, Object> httpHeaders, OutputStream entityStream) throws IOException, WebApplicationException {
        try {
            BinaryPropertyListWriter.write(entityStream, nsObject);
        } catch (Exception e) {
            throw new IOException(e);
        }
    }
}