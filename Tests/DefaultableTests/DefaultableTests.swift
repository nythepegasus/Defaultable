import Testing
@testable import Defaultable
@testable import DefaultableFoundation


struct User: Equatable {
    let name: String?
    let age: Int?
    
    init(name: String? = nil, age: Int? = nil) {
        self.name = name
        self.age = age
    }
}

extension User: Defaultable {
    public static var DV: Self { .init() }
}

struct Post: Equatable {
    let title: String?
    let author: User?
    
    init(title: String? = nil, author: User? = nil) {
        self.title = title
        self.author = author
    }
}

extension Post: Defaultable {
    public static var DV: Self { .init() }
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
            "name": "ny :3",
            "age": 84,
            "email": nil
        ]
        for (key, value) in fetchedData {
            if key == "email" { let v: String = value~; #expect(v == .DV); print("email: \(v)") }
            if key == "age" { let v: Int = value~; #expect(84 == v); print("age: \(v)") }
            if key == "name" { let v: String = value~; #expect("ny :3" == v); print("name: \(v)") }
        }
    }

    @Test("Casting String from Any?")
    func castAnyOptionalString() throws {
        func buh() -> Any? { "buh" }
        let s: String = buh()~
        #expect(s == "buh")
    }

    @Test("Casting Int from Any")
    func castAnyInt() throws {
        func buh() -> Any { 84 }
        let s: Int = buh()~
        #expect(s == 84)
    }
    
    @Test("Simple struct")
    func nyUser() async throws {
        #expect("ny" == ny.name~)
        #expect(84 == ny.age~)
    }
    
    @Test("Nested struct")
    func nyPost() async throws {
        #expect("hello" == post.title~)
        #expect(ny == post.author~)
    }
    
    @Test("nil struct")
    func nilStruct() async throws {
        let u: User? = nil
        #expect(u == nil)
        #expect(u~ == .DV)
        #expect("" == u~.name~)
        #expect(0 == u~.age~)
    }
    
    @Test("nil Nested struct")
    func nilNestedStruct() async throws {
        let p: Post? = nil
        #expect(p == nil)
        #expect(p~ == .DV)
        #expect(p~.title~ == .DV)
        #expect(p~.author~ == .DV)
    }
    
    @Test("ascii bytes")
    func asciiBytes() async throws {
        let ny: [UInt8] = [78, 121]
        #expect("Ny" == String(bytes: ny, encoding: .ascii)~)
    }
}
