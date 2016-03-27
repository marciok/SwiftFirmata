import Foundation

let firmata = SwiftFirmata(connection: "/dev/cu.usbmodem1421", baud: 5600)
let pin = Pin(number: 13, mode: .Output)
firmata.configurePinMode(pin)

while (true) {
  // firmata.digitalWrite(pin, level: .High)
  sleep(2)
  firmata.digitalWrite(pin, level: .Low)
  sleep(2)
}

