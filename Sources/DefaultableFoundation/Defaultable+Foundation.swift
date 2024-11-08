//
//  Defaultable+Foundation.swift
//  Defaultable
//
//  Created by ny on 10/23/24.
//

import Foundation

import Defaultable

extension Int: Defaultable {
    public static var DV: Int { 0 }
}

extension Double: Defaultable {
    public static var DV: Double { 0.0 }
}

extension Decimal: Defaultable {
    public static var DV: Decimal { 0.0 }
}

extension Float: Defaultable {
    public static var DV: Float { 0.0 }
}

// Possibly TODO: `NumberFormatter`

extension Data: Defaultable {
    public static var DV: Data { Data() }
}

extension URL: Defaultable {
    public static var DV: URL { URL(string: "https://nythepegas.us")! }
}

extension String: Defaultable {
    public static var DV: String { "" }
}

extension Bool: Defaultable {
    public static var DV: Bool { false }
}

#if canImport(Darwin)

/// An extension for common `Bundle` accesses
public extension Bundle {
    
    enum Keys: String {
        
        // MARK: - Categorization
        
        case appCategoryType = "LSApplicationCategoryType"
        
        case packageType = "CFBundlePackageType"
        
        // MARK: - Identification
        
        case identifier = "CFBundleIdentifier"
        
        case wkidentifier = "WKAppBundleIdentifier"
        
        case wkCompanionIdentifier = "WKCompanionAppBundleIdentifier"
        
        // MARK: - Naming
        
        case name = "CFBundleName"
        
        case displayName = "CFBundleDisplayName"
        
        case spokenName = "CFBundleSpokenName"
        
        // MARK: - Bundle version
        
        case version = "CFBundleVersion"
        
        case shortVersion = "CFBundleShortVersionString"
        
        case infoVersion = "CFBundleInfoDictionaryVersion"
        
        case copyright = "NSHumanReadableCopyright"
        
        // MARK: - Operating System version
        
        case minimumMacOSVersion = "LSMinimumSystemVersion"
        
        case minimumMacOSVersionByArchitecture = "LSMinimumSystemVersionByArchitecture"
        
        case minimumOSVersion = "MinimumOSVersion"
    
        case requiresiOS = "LSRequiresIPhoneOS"
        
        case watchKitApp = "WKWatchKitApp"
        
        case watchKitAppIndependent = "WKRunsIndependentlyOfCompanionApp"
        
        case watchKitAppOnly = "WKWatchOnly"

        case watchKitDelegate = "WKExtensionDelegateClassName"
        
        case newWK = "WKApplication"
        
        case requiredDeviceCapabilities = "UIRequiredDeviceCapabilities"
        
        case multipleInstancesProhibited = "LSMultipleInstancesProhibited"
        
        case backgroundModes = "UIBackgroundModes"
        
        case requiresMacCatalyst = "LSRequiresMacCatalyst"
        
        case requirestvOS = "LSRequiresTVOS"
        
        case requiresPersistentWiFi = "UIRequiresPersistentWiFi"
        
        case supportsFileSharing = "UIFileSharingEnabled"
        
        case supportsDocumentsInPlace = "LSSupportsOpeningDocumentsInPlace"
        
        case supportsDocumentsBrowser = "UISupportsDocumentBrowser"
    }
    
    func object<T: Defaultable>(for key: String) -> T { object(forInfoDictionaryKey: key)~ }
    
    func object<T: Defaultable>(for key: Keys) -> T { object<T>(for: key.rawValue) }
    
    func keyExists(_ key: String) -> Bool { object(forInfoDictionaryKey: key) != nil }
    
    func keyExists(_ key: Keys) -> Bool { keyExists(key.rawValue) }
    
    // MARK: - Var accesses for each key
    var appCategoryType: String { object<String>(for: .appCategoryType) }
    
    var packageType: String { object<String>(for: .packageType) }
    
    var identifier: String { object<String>(for: .identifier) }
    
    var wkIdentifier: String { object<String>(for: .wkidentifier) }
    
    var wkCompanionIdentifier: String { object<String>(for: .wkCompanionIdentifier) }
    
    var name: String { object<String>(for: .name) }
    
    var displayName: String { object<String>(for: .displayName) }
    
    var spokenName: String { object<String>(for: .spokenName) }
    
    var version: String { object<String>(for: .version) }
    
    var shortVersion: String { object<String>(for: .shortVersion) }
    
    var infoVersion: String { object<String>(for: .infoVersion) }
    
    var copyright: String { object<String>(for: .copyright) }
    
    var minimumMacOSVersion: String { object<String>(for: .minimumMacOSVersion) }
    
    var minimumMacOSVersionByArchitecture: String { object<String>(for: .minimumMacOSVersionByArchitecture) }
    
    var minimumOSVersion: String { object<String>(for: .minimumOSVersion) }
    
    var requiresiOS: Bool { object<Bool>(for: .requiresiOS) }
    
    var watchKitApp: Bool { object<Bool>(for: .watchKitApp) }
    
    var watchKitAppIndependent: Bool { object<Bool>(for: .watchKitAppIndependent) }
    
    var watchKitAppOnly: Bool { object<Bool>(for: .watchKitAppOnly) }
    
    var watchKitDelegate: String { object<String>(for: .watchKitDelegate) }
    
    var newWK: String { object<String>(for: .newWK) }
    
    var requiredDeviceCapabilities: [String] { object<[String]>(for: .requiredDeviceCapabilities) }
    
    var multipleInstancesProhibited: Bool { object<Bool>(for: .multipleInstancesProhibited) }
    
    var backgroundModes: [String] { object<[String]>(for: .backgroundModes) }
    
    var requiresMacCatalyst: Bool { object<Bool>(for: .requiresMacCatalyst) }
    
    var requirestvOS: Bool { object<Bool>(for: .requirestvOS) }
    
    var requiresPersistentWiFi: Bool { object<Bool>(for: .requiresPersistentWiFi) }
    
    var supportsFileSharing: Bool { object<Bool>(for: .supportsFileSharing) }
    
    var supportsDocumentsInPlace: Bool { object<Bool>(for: .supportsDocumentsInPlace) }
    
    var supportsDocumentsBrowser: Bool { object<Bool>(for: .supportsDocumentsBrowser) }
}

#endif
