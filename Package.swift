// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskChatSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskChatSDK",
            targets: [ "ZendeskChatSDKTargets" ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskChatProvidersSDK",
                 url: "https://github.com/zendesk/chat_providers_sdk_ios",
                 from: "2.10.0"),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/zendesk/messaging_sdk_ios",
                 from: "3.8.1"),
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskChatSDK",
            url: "https://github.com/zendesk/chat_sdk_ios/releases/download/2.10.0/ChatSDK.xcframework.zip",
            checksum: "01238e011b9f1c2ed30603ae63e7f9e7b78b4c2dadc383967be0d3588afdf921"
        ),
        .target(name: "ZendeskChatSDKTargets",
                dependencies: [
                    .target(name: "ZendeskChatSDK"),
                    .product(name: "ZendeskMessagingSDK", package: "ZendeskMessagingSDK")
                ],
                path: "Sources"
        )
    ]
)
