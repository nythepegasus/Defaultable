//
//  Defaultable+Foundation.swift
//  Defaultable
//
//  Created by ny on 10/23/24.
//

import Foundation

@_exported import Defaultable

extension UInt: Defaultable {
    public static var DV: UInt { 0 }
}

extension Int: Defaultable {
    public static var DV: Int { 0 }
}

extension UInt64: Defaultable {
    public static var DV: UInt64 { 0 }
}

extension UInt32: Defaultable {
    public static var DV: UInt32 { 0 }
}

extension UInt16: Defaultable {
    public static var DV: UInt16 { 0 }
}

extension UInt8: Defaultable {
    public static var DV: UInt8 { 0 }
}

extension Int64: Defaultable {
    public static var DV: Int64 { 0 }
}

extension Int32: Defaultable {
    public static var DV: Int32 { 0 }
}

extension Int16: Defaultable {
    public static var DV: Int16 { 0 }
}

extension Int8: Defaultable {
    public static var DV: Int8 { 0 }
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
    
    func object<T: Defaultable>(for key: Keys) -> T { object(for: key.rawValue) }
    
    func keyExists(_ key: String) -> Bool { object(forInfoDictionaryKey: key) != nil }
    
    func keyExists(_ key: Keys) -> Bool { keyExists(key.rawValue) }
    
    // MARK: - Var accesses for each key
    var appCategoryType: String { object(for: .appCategoryType) }
    
    var packageType: String { object(for: .packageType) }
    
    var identifier: String { object(for: .identifier) }
    
    var wkIdentifier: String { object(for: .wkidentifier) }
    
    var wkCompanionIdentifier: String { object(for: .wkCompanionIdentifier) }
    
    var name: String { object(for: .name) }
    
    var displayName: String { object(for: .displayName) }
    
    var spokenName: String { object(for: .spokenName) }
    
    var version: String { object(for: .version) }
    
    var shortVersion: String { object(for: .shortVersion) }
    
    var infoVersion: String { object(for: .infoVersion) }
    
    var copyright: String { object(for: .copyright) }
    
    var minimumMacOSVersion: String { object(for: .minimumMacOSVersion) }
    
    var minimumMacOSVersionByArchitecture: String { object(for: .minimumMacOSVersionByArchitecture) }
    
    var minimumOSVersion: String { object(for: .minimumOSVersion) }
    
    var requiresiOS: Bool { object(for: .requiresiOS) }
    
    var watchKitApp: Bool { object(for: .watchKitApp) }
    
    var watchKitAppIndependent: Bool { object(for: .watchKitAppIndependent) }
    
    var watchKitAppOnly: Bool { object(for: .watchKitAppOnly) }
    
    var watchKitDelegate: String { object(for: .watchKitDelegate) }
    
    var newWK: String { object(for: .newWK) }
    
    var requiredDeviceCapabilities: [String] { object(for: .requiredDeviceCapabilities) }
    
    var multipleInstancesProhibited: Bool { object(for: .multipleInstancesProhibited) }
    
    var backgroundModes: [String] { object(for: .backgroundModes) }
    
    var requiresMacCatalyst: Bool { object(for: .requiresMacCatalyst) }
    
    var requirestvOS: Bool { object(for: .requirestvOS) }
    
    var requiresPersistentWiFi: Bool { object(for: .requiresPersistentWiFi) }
    
    var supportsFileSharing: Bool { object(for: .supportsFileSharing) }
    
    var supportsDocumentsInPlace: Bool { object(for: .supportsDocumentsInPlace) }
    
    var supportsDocumentsBrowser: Bool { object(for: .supportsDocumentsBrowser) }
}

#endif
