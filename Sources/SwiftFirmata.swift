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

public enum SwiftFirmataError: ErrorType {
    case couldntConnect
}

public final class SwiftFirmata {
  private var firmataC: UnsafeMutablePointer<t_firmata>

  public init(connect: String, baud: Int) throws {
    self.firmataC = firmata_new(strdup(connect), Int32(baud))

    if self.firmataC == nil {
      throw SwiftFirmataError.couldntConnect
    }
  }

  deinit {
    if self.firmataC != nil {
      free(self.firmataC)
    }
  }

  public func configure(pin: Pin) {
    firmata_pinMode(firmataC, Int32(pin.number), Int32(pin.mode.rawValue))
  }

  public func digitalWrite(pin: Pin, level: DigitalLevel) {
    firmata_digitalWrite(firmataC, Int32(pin.number), Int32(level.rawValue))
  }

  public func analogWrite(pin: Pin, width: Int) {
    firmata_analogWrite(firmataC, Int32(pin.number), Int32(width))
  }
}



