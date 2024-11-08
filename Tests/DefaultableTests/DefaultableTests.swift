import Testing
@testable import Defaultable
@testable import DefaultableFoundation


struct User: Equatable {
    let name: String?
    let age: Int?
    
    init(name: String? = nil, age: Int? = nil) {
        self.name = name~
        self.age = age~
    }
}

extension User: Defaultable {
    public static var DV: Self { .init() }
}

struct Post: Equatable {
    let title: String?
    let author: User?
    
    init(title: String? = nil, author: User? = nil) {
        self.title = title~
        self.author = author~
    }
}

extension Post: Defaultable {
    public static var DV: Self { .init() }
}

extension Equatable {
    /// For better type checking
    func same(_ other: Self) -> Bool { self == other }
}


@Suite("Defaultable Sanity Tests", .serialized)
struct DefaultableSanityTests {
    static let _ny = User(name: "ny", age: 84)
    static let _post = Post(title: "hello", author: _ny)
    
    var ny: User { Self._ny }
    var post: Post { Self._post }
    
    @Test("Casting Any")
    func castAny() async throws {
        let fetchedData: [String: Any?] = [
            "name": "Alice",
            "age": 25,
            "email": nil
        ]
        for (key, value) in fetchedData {
            if value == nil {
                if key.same("email") { print(value ~~ String.self) }
            }
        }
    }
    
    @Test("Simple struct")
    func nyUser() async throws {
        #expect("ny".same(ny.name~))
        #expect(84.same(ny.age~))
    }
    
    @Test("Nested struct")
    func nyPost() async throws {
        #expect("hello".same(post.title~))
        #expect(ny.same(post.author~))
    }
    
    @Test("nil struct")
    func nilStruct() async throws {
        let u: User? = nil
        #expect(u.same(nil))
        #expect(User.DV.same(u~))
        #expect("".same(u~.name~))
        #expect(0.same(u~.age~))
    }
    
    @Test("nil Nested struct")
    func nilNestedStruct() async throws {
        let p: Post? = nil
        #expect(p.same(nil))
        #expect(Post.DV.same(p~))
        #expect("".same(p~.title~))
        #expect(User.DV.same(p~.author~))
    }
    
    @Test("ascii bytes")
    func asciiBytes() async throws {
        let ny: [UInt8] = [78, 121]
        print(String(bytes: ny, encoding: .ascii))
    }
}
