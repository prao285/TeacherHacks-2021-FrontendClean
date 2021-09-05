import SwiftUI
import CodeScanner

var codeList = [String?]() 

struct QRScannerView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String? {
        didSet{
            codeList.append(scannedCode)
            print(codeList)
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            Button("Scan Code") {
                self.isPresentingScanner = true
            }
            .font(.system(size: 75))
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
            .padding(.init(top: 0, leading: 15, bottom: 100, trailing: 0))
            NavigationLink(destination: AttendenceReportView(), label: {
                Text("View Attendance")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.gray)
            })
           
        }
    }

    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.isPresentingScanner = false
                }
            }
        )
    }
}
struct QRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerView()
    }
}
