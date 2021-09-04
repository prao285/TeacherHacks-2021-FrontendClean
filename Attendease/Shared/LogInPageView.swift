import SwiftUI

struct LogInPageView: View {
    var body: some View {
        ZStack {
            VStack {
                CircleImage()
                    .padding(25)
                SignIn()
            }
        }
    }
}

struct LogInPageView_Previews: PreviewProvider {
    static var previews: some View {
        LogInPageView()
    }
}
