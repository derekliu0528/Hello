import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("view") { req -> Future<View> in
        return try req.view().render("welcome")
    }
    
    router.get("bonus") { req -> Future<View> in
        let data = ["name": "Ethan", "age": "26"]
        return try req.view().render("whoami", data)
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
