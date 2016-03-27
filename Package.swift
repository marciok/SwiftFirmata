import PackageDescription

let package = Package(
    name: "Firmata",
    dependencies: [
        .Package(url: "https://github.com/marciok/CFirmata.git", majorVersion: 0)
    ]
)
