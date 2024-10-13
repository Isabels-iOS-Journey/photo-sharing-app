//
//  ContentView.swift
//  photo-sharing-app
//
//  Created by Isabel Quijada on 19.09.24.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var signInMessage: String = "" // Mensaje para mostrar el estado del inicio de sesión
    
    private let userRepository = UserRepository() // Instancia del repositorio de usuarios
    
    var body: some View {
        VStack(spacing: 20) {
            // Campo de texto para el email
            TextField("Username", text: $username)
                .padding()
                .background(Color(red: 0.678, green: 0.847, blue: 0.902))
                .cornerRadius(8)
                .shadow(radius: 2)
                .keyboardType(.phone) // Sugerir teclado de email
            
            // Campo de texto para la contraseña
            SecureField("Password", text: $password)
                .padding()
                .background(Color(red: 0.678, green: 0.847, blue: 0.902))
                .cornerRadius(8)
                .shadow(radius: 2)
            
            // Botón de inicio de sesión
            Button(action: {
                // Llamada al método de verificación de credenciales
                if userRepository.isValidUser(email: username, password: password) {
                    signInMessage = "Login successful!" // Si es exitoso
                } else {
                    signInMessage = "Invalid email or password." // Si falla
                }
            }) {
                Text("Sign In")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .cornerRadius(8)
            }
            
            // Mensaje de estado del inicio de sesión
            Text(signInMessage)
                .foregroundColor(signInMessage == "Login successful!" ? .green : .red)
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
