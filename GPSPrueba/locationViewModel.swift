//
//  LocationViewModel.swift
//  GPSPrueba
//
//  Created by Lucely Mendoza on 12/11/24.
//

import Combine
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLocation: CLLocation?
    private let locationManager = CLLocationManager()

    // Inicializador
    override init() {
        super.init()
        locationManager.delegate = self
        // Solicita permiso para usar la ubicación cuando la app está en uso
        locationManager.requestWhenInUseAuthorization()
        // Solicita permiso para usar la ubicación siempre (si es necesario)
        locationManager.requestAlwaysAuthorization()
        // Inicia la actualización de la ubicación
        locationManager.startUpdatingLocation()
    }

    // Método delegado que se llama cuando la ubicación cambia
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Actualiza la ubicación del usuario
        userLocation = locations.last
    }

    // Método delegado que se llama cuando hay un error al obtener la ubicación
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error al obtener la ubicación: \(error)")
    }
}
