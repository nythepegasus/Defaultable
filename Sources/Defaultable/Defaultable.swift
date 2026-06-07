
// MARK: Custom Operators

postfix operator ~

// MARK: Protocol Declaration

public protocol Defaultable {
    @inlinable
    static var DV: Self { get }
}

// MARK: Default Implementations

public extension Optional where Wrapped: Defaultable {
    @inlinable
    static postfix func ~ (_ lhs: Self) -> Wrapped { lhs ?? Wrapped.DV }
}

public extension Any? {
    @inlinable
    static postfix func ~ <T>(_ lhs: Self) -> T? { (lhs as? T) }
    @inlinable
    static postfix func ~ <T: Defaultable>(_ lhs: Self) -> T { (lhs as? T) ?? T.DV }
}

extension Optional: Defaultable where Wrapped: Defaultable {
    public static var DV: Optional<Wrapped> { .some(Wrapped.DV) }
}

extension CollectionOfOne: Defaultable where Element: Defaultable {
    public static var DV: CollectionOfOne<Element> { CollectionOfOne(.DV) }
}

extension EmptyCollection: Defaultable {
    public static var DV: EmptyCollection<Element> { EmptyCollection() }
}

extension Array: Defaultable {
    public static var DV: Array<Element> { [] }
}

extension Dictionary: Defaultable {
    public static var DV: Dictionary<Key, Value> { [:] }
}

extension Set: Defaultable {
    public static var DV: Set<Element> { [] }
}

