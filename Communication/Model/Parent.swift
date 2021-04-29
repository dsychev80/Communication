import Foundation

struct Child: Hashable {
    var name: String
    var age: UInt
}

class Parent {
    private let id: String
    var name: String
    var surname: String
    var patronymic: String
    var age: UInt
    private var childs: Set<Child> = []
    
    init(name: String, surname: String, patronymic: String, age: UInt) {
        self.id = UUID().uuidString
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        self.age = age
    }
    
    public func addChild(withName name: String, andAge age: UInt) {
        guard !childs.contains(where: { $0.name == name }) else { return }
        let child = Child(name: name, age: age)
        childs.insert(child)
    }
    
    public func removeChild(withName name: String) {
        for child in childs {
            if child.name == name {
                childs.remove(child)
            }
        }
    }
    
    public func update(oldChild: Child, withNew newChild: Child ) {
        for child in childs {
            if child.name == oldChild.name {
                childs.remove(oldChild)
                childs.insert(newChild)
            }
        }
    }
    
    public func returnChilds() -> [Child] {
        return Array(childs.sorted{ $0.age < $1.age })
    }
}
