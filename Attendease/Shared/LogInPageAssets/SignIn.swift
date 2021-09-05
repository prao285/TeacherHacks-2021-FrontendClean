import SwiftUI




struct SignIn: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isEditingUser = false
    @State private var isEditingPass = false
    @State private var goToStart = false
    @State private var verifyLoginId = false
    
    var body: some View {
        
        VStack {
            TextField(
                "Username",
                text: $username
            ) { isEditingUser in
                self.isEditingUser = isEditingUser
            }
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(.bottom, 7)
            .background(Capsule()
                            .offset(y: -3)
                            .scale(1.2)
                            .stroke(Color.gray))
            .padding(.bottom, 2)
            SecureField(
                "Password",
                text: $password
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(.bottom, 7)
            .background(Capsule()
                            .offset(y: -3)
                            .scale(1.2)
                            .stroke(Color.gray))
            
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: 100,
            minHeight: 0,
            maxHeight: 75
        )
        
        VStack {
            
            NavigationLink(destination: YourClassView(), isActive: $verifyLoginId) {
                EmptyView()
            }
            Button("Sign In", action: signIn)
        }
        
        
    }
    
    func signIn(){
        // setup
        LoginTeacher.teacher?.id = -1
        
        print(LoginTeacher.teacher)
        
        let url = URL(string: String(format: "https://qr-attend.herokuapp.com/api/qrattend/GetByUsernameandPassword?username=%1@&password=%2@", username, password))
        
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var set = true
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data{
                do {
                    let res = try JSONDecoder().decode(Teacher.self, from: data)
                    LoginTeacher.teacher = res;
                    set = false
                } catch let error {
                    print(error)
                    set = false
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
                set = false
            }
        }
        
        task.resume()
        
        while(set) { }
        print(LoginTeacher.teacher)
        if (LoginTeacher.teacher?.id != -1) {
            self.verifyLoginId = true
            self.password = ""
        }
    }
}







struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
