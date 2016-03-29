# SwiftFirmata
A Swift wrapper on CFirmata.

The idea is to provide a framework to control Arduino using Swift, by implementing a [Firmata protocol](firmata.org/wiki/V2.3ProtocolDetails) client.

Heavily inspired on: https://github.com/younata/firmata

## Building:
```shell
cd Packages/CFirmata-0.3.0/
sudo make install
cd ../../
swift build 
```

## Example:
### [blink.swift](https://github.com/marciok/swiftfirmata/blob/master/examples/blink.swift)
```swift
import Foundation

// Blink led hooked on pin 13
let firmata = SwiftFirmata(connect: "/dev/cu.usbmodem1421", baud: 57600)
let pin = Pin(number: 13, mode: .Output)
firmata.configure(pin)

while (true) {
  firmata.digitalWrite(pin, level: .High)
  sleep(2)
  firmata.digitalWrite(pin, level: .Low)
  sleep(2)
}
```
