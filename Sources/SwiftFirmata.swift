import CFirmata
#if os(Linux)
import Glibc
#endif

public enum DigitalLevel: Int {
  case Low, High
}

public enum PinMode: Int {
  case Input, Output
}

public struct Pin {
  let number: Int
  let mode: PinMode
}

public struct SwiftFirmata {
  private let firmataC: UnsafeMutablePointer<t_firmata>

  public init(connection: String, baud: Int) {
    self.firmataC = firmata_new(strdup(connection))
  }

  public func configurePinMode(pin: Pin) {
    firmata_pinMode(firmataC, Int32(pin.number), Int32(pin.mode.rawValue))
  }

  public func digitalWrite(pin: Pin, level: DigitalLevel) {
    firmata_digitalWrite(firmataC, Int32(pin.number), Int32(level.rawValue))
  }
}



