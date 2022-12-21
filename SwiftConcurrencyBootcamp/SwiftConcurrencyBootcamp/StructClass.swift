//
//  StructClass.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Denys on 19.12.2022.
//

import SwiftUI

struct StructClass: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                runTest()
            }
    }
}

struct StructClass_Previews: PreviewProvider {
    static var previews: some View {
        StructClass()
    }
}

struct MyStruct {
    var little: String
}


extension StructClass {
    
    private func runTest() {
        print("Test started")
        structTest2()
        //classTest()
    }
    
    private func structTest1() {
        let objectA = MyStruct(little: "Starting title")
        print("ObjectA: ", objectA.little)
        let objectB = objectA
        print("ObjectA: ", objectB.little)
    }
    
    private func classTest() {
        let myClass1 = MyClass(title: "First Class")
        print("My Class1: ", myClass1.title)
        let myClass2 = myClass1
        print("My Class2: ", myClass2.title)
        myClass2.title = "Second Class"
        print("My Class1: ", myClass1.title)
        print("My Class2: ", myClass2.title)
    }
}

struct CustomStruct {
    let title: String
    
    func updateTitle(title: String) -> CustomStruct {
        return CustomStruct(title: title)
    }
}

struct MutatingStruct {
    private(set) var title: String
    
    init(title: String) {
        self.title = title
    }
    
    mutating func updateTitle(newTitle: String) {
        self.title = newTitle
    }
}

extension StructClass {
    private func structTest2() {
        print("structTest2")
        
        var struct1 = MyStruct(little: "Title1")
        print("Struct1: ", struct1.little)
        
        struct1.little = "Title2"
        print("Struct1 ", struct1.little)
        
        var struct2 = CustomStruct(title: "Title1")
        print("Struct2 ", struct2.title)
        struct2 = CustomStruct(title: "Title2")
        print("Struct2: ", struct2.title)
        struct2 = struct2.updateTitle(title: "Title3")
        print("Struct2: ", struct2.title)
        
        var struct3 = MutatingStruct(title: "Title1")
        print(struct3.title)
    }
}

class MyClass {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func updateTitle(newTitle: String) {
        title = newTitle
    }
}

actor MyActor {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func updateTitle(newTitle: String) {
        title = newTitle
    }
}

extension StructClass {
    private func classTest2() {
        print("classTest2")
        
        let class1 = MyClass(title: "Title1")
        print("Class1: ", class1.title)
        class1.title = "Title2"
        print("Class1: ", class1.title)
        
        let class2 = MyClass(title: "Title1")
        print("Class2: ", class2.title)
        class1.updateTitle(newTitle: "Title2")
        print("Class1: ", class1.title)
    }
    
    private func actorTest1() {
        Task {
            let myClass1 = MyActor(title: "First Class")
            await print("My Class1: ", myClass1.title)
            let myClass2 = myClass1
            await print("My Class2: ", myClass2.title)
            
            await myClass2.updateTitle(newTitle: "Second Class")
            await print("My Class1: ", myClass1.title)
            await print("My Class2: ", myClass2.title)
        }
    }
}
