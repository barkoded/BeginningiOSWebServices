package eu.barkode.jaxrs.protobuf;

import com.google.protobuf.GeneratedMessage;
import com.google.protobuf.Message;
import eu.barkode.jaxrs.MediaTypeUtil;

import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.ext.MessageBodyReader;
import javax.ws.rs.ext.MessageBodyWriter;
import javax.ws.rs.ext.Provider;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Type;

@Provider
@Consumes(MediaTypeUtil.APPLICATION_PROTOBUF)
@Produces(MediaTypeUtil.APPLICATION_PROTOBUF)
public class GoogleJaxbProtobufProvider implements MessageBodyReader<Message>, MessageBodyWriter<Message> {

    public GoogleJaxbProtobufProvider() {
        super();
    }

    @Override
    public boolean isReadable(Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType) {
        return Message.class.isAssignableFrom(type);
    }

    @Override
    public Message readFrom(Class<Message> type, Type genericType, Annotation[] annotations,
                            MediaType mediaType, MultivaluedMap<String, String> httpHeaders,
                            InputStream entityStream) throws IOException, WebApplicationException {
        try {
            Method newBuilder = type.getMethod("newBuilder");
            GeneratedMessage.Builder builder = (GeneratedMessage.Builder) newBuilder.invoke(type);
            return builder.mergeFrom(entityStream).build();
        } catch (Exception e) {
            throw new WebApplicationException(e);
        }
    }

    @Override
    public boolean isWriteable(Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType) {
        return Message.class.isAssignableFrom(type);
    }

    @Override
    public long getSize(Message m, Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType) {
        return Integer.valueOf(m.getSerializedSize()).longValue();
    }

    @Override
    public void writeTo(Message m, Class type, Type genericType, Annotation[] annotations,
                        MediaType mediaType, MultivaluedMap httpHeaders,
                        OutputStream entityStream) throws IOException, WebApplicationException {
        m.writeTo(entityStream);
    }
}