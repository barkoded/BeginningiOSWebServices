# Server

Before you are able to start the server you need to download and install Apache Maven, Google Protocol Buffers and Java. If you are using Homebrew (http://mxcl.github.com/homebrew/) then installing Maven and Protocol Buffers are as easy as typing: 
    
	$brew install maven
    $brew install protobuf

After you have successfully installed Apache Maven and Protocol Buffers you'll need to install dd-plist.jar into the Maven repository. This should only be done once (or everytime the dd-plist.jar is updated to a newer version). You can install the jar artifact into the Maven repository by executing the install.sh script found in the server folder.

    $cd Server/
	$sh install.sh

Now you should be ready to start the server by typing: 
    
	$cd Server/beginningiOSWebSercies
    $mvn clean jetty:run
	
# Client

Requirements:

## wsdl2Objc


## Protobuf

    $export SRC_DIR=[PATH]
    $export DST_DIR=[PATH]
    $protoc -I=$SRC_DIR --objc_out=$DST_DIR $SRC_DIR/addressbook.proto

