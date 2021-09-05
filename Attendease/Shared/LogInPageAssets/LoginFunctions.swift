import Foundation

struct LoginTeacher{
    static var teacher: Teacher? = Teacher(id: -1, firstName: "", middleName: "", lastName: "", pictureUrl: "", userName: "", password: "")
}

struct Teacher: Codable{
    var id: Int
    var firstName: String
    var middleName: String
    var lastName: String
    var pictureUrl: String?
    var userName: String
    var password: String
}
