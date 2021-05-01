import Foundation

struct Child: Hashable {
    var name: String = ""
    var age: UInt = 0
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
    
    // FIXME: Remove business logic into a separate class "ParentController"
    public func addChild(withName name: String, andAge age: UInt) {
        defer {
            removeChild(withName: "")
        }
        
        let child = Child(name: name, age: age)
        
        guard !childs.contains(where: { $0 == child }) else { return }
        
        if let childWithSameName = childs.first(where: { $0.name == child.name }) {
            self.update(oldChild: childWithSameName, withNew: child)
            return
        }
        
        childs.insert(child)
        
        return
    }
    
    public func addNewChild() {
        self.childs.insert(Child())
    }
    
    public func removeChild(withName name: String) {
        for child in childs {
            if child.name == name {
                childs.remove(child)
            }
        }
    }
    
    private func update(oldChild: Child, withNew newChild: Child ) {
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
