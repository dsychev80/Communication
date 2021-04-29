import Foundation

class MockData {
    private var person: Parent
    
    init() {
        self.person = Parent(name: "John", surname: "Dow", patronymic: "Wilson", age: 35)
        self.person.addChild(withName: "Kirk", andAge: 10)
        self.person.addChild(withName: "Clark", andAge: 8)
        self.person.addChild(withName: "Sydney", andAge: 13)
    }
    
    public func getPerson() -> Parent {
        return self.person
    }
    
    public func getChilds() -> [Child] {
        self.person.returnChilds()
    }
}
