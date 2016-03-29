import Foundation

let firmata = try! SwiftFirmata(connect: "/dev/cu.usbmodem1421", baud: 57600)
let pin = Pin(number: 13, mode: .Output)
firmata.configure(pin)

while (true) {
  firmata.digitalWrite(pin, level: .High)
  sleep(2)
  firmata.digitalWrite(pin, level: .Low)
  sleep(2)
}

