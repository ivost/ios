# Asynchronous call to an iPhone

Testing ideas on how to implement asynchronous calls to an iPhone. 

The software combines functions from [Grand Central Dispatch ( GCD )](https://developer.apple.com/library/ios/documentation/Performance/Reference/GCD_libdispatch_Ref/Reference/reference.html) and [Block](https://developer.apple.com/library/ios/documentation/cocoa/Conceptual/Blocks/Articles/00_Introduction.html) objects to manage asychronous messages from a server.



# Software

* Operating System : Mac OS 10.9 ( Mavericks )
* Node Version : v0.10.0 
* Node Package Manager ( NPM ) : v1.2.14 
* Xcode version 5.0
* ZeroMQ ( see [iPhone-ZeroMQ](https://github.com/dtinblack/iPhone-ZeroMQ ) for information on creating an iOS Framework for ZeroMQ and installing into a project )

# Run

<ol>
<li>Compile and run in Xcode</li>
<li>Wait until the Simulator runs and "App: Hello World" appears</li>
<li>Open a Terminal, move into the Server folder and type: node push.js</li>
</ol>

# Licence

[See Licence](https://github.com/dtinblack/iPhone-PushMsg/blob/master/LICENSE)

