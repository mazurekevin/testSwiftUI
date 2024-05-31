import SwiftUI
import Alamofire
import SwiftyJSON

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var showingAlert = false
    @State private var isLoggedIn = false // State to track login status

    var body: some View {
        Group {
            if isLoggedIn {
                NavBar()
            } else {
                loginForm
            }
        }
    }

    var loginForm: some View {
        VStack {
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)

            Button(action: {
                login()
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
        }
    }

    private func login() {
        let loginRequest = LoginRequest.login(email: "kmazure@teamdoc.fr", password: "Jesuislemdp-06")
        let loginOperation = LoginOperations.custom(loginRequest)
        
        loginOperation.performRequest { json in
            // Handle successful login
            print("Login successful: \(String(describing: json))")
            Config.instance.token = json!["token"].stringValue
            isLoggedIn = true
        } failure: { error in
            // Handle login failure
            errorMessage = error.localizedDescription
            showingAlert = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
