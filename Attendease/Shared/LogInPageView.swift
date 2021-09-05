import SwiftUI

struct LogInPageView: View {
    var body: some View {
       NavigationView{
            VStack {
                CircleImage()
                    .navigationTitle("Sign In")
                    .padding(25)
                SignIn()
            }
       }
       .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct LogInPageView_Previews: PreviewProvider {
    static var previews: some View {
        LogInPageView()
    }
}
