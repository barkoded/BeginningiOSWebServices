Client

Requirements:

brew install protobuf


Protobuf



export SRC_DIR=[PATH]/
protoc -I=$SRC_DIR --objc_out=$DST_DIR $SRC_DIR/addressbook.proto




Server

Requirements:

brew install maven

mvn clean jetty:run