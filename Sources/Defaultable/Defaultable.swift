
// MARK: Custom Operators

postfix operator ~
infix operator ~~: AssignmentPrecedence

// MARK: Protocol Declaration

public protocol Defaultable {
    @inlinable
    static var DV: Self { get }
}

// MARK: Default Implementations

public extension Optional where Wrapped: Defaultable {
    @inlinable
    static postfix func ~ (_ lhs: consuming Self) -> Wrapped { lhs ?? Wrapped.DV }
    
    @inlinable
    static func ~~ (lhs: consuming Any?, rhs: borrowing Wrapped.Type) -> Wrapped { (lhs as? Wrapped)~ }
}

public extension Any? {
    static postfix func ~ <T: Defaultable>(_ lhs: Self) -> T { (lhs as? T)~ }
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