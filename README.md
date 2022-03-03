# Hepsiburada Case Study

# Application Infrastructure is created

1. NetworkEntityLayer
2. NetworkLayer
3. DomainLayer
4. DataLayer
5. Application

# Advance Patterns are implemented

1. Factory Pattern
    - To build object without exposing creation logic, factory pattern is one of the best solutions. usecase, repository, remote etc creation logic are isolated from viewmodels.

2. UseCase - Repository Pattern
    - To create communication between layers, this patterns are used. By using usecases, presentation layer are free from any design pattern. Because domain layer can be injected any design patter without any business dependency.

3. Coordinator Pattern + MVVM Design Pattern
    - MVVM is one the most common presentation layer pattern among developers. In this project, coordinator pattern injected in presentation layer. Coordinator encapsulates views and viewmodels and creates a coordinator modules to build parent - child hierarchy in view life cycles. There are many significant benefits like is the fact that views are not responsible for routing, organizing flow logic between controllers etc.

# User interface developments

1. Programmatic approach and interfaca builder are used together to build user interface components.
2. Custom image component is generated. Memory caching is used for thumbnails and disk caching mechanism is used for bigger images.
3. Infinite scrolling and pagination is implemented.
4. Search mechanism is implemented by using workitems.
5. Custom segment button component created. The last selected media type is stored for later usages. 
6. Generic source codes and base modules are created.
7. Custom alert views added and errors handled.
8. Main and detail pages are created. Detail page has a bigger picture and long description of the item. (Some data does not have long descriptions)
