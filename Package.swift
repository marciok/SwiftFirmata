import PackageDescription

let package = Package(
    name: "Firmata",
    dependencies: [
        .Package(url: "https://github.com/younata/CFirmata.git", majorVersion: 0)
    ]
)
