import SwiftUI




struct SignIn: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isEditingUser = false
    @State private var isEditingPass = false
    var body: some View {
        
        VStack {
            TextField(
                    "Username",
                     text: $username
                ) { isEditing in
                    self.isEditingUser = isEditing
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
            ) {
                
            }
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
        
        Button("Sign In", action: signIn)
        
    }
    
    func signIn(){
          let params = ["username": self.username, "password": self.password] as Dictionary<String, String>
          print(params)
        
    }
    
    
}




struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
