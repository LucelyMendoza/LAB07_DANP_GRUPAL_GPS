import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
            .onAppear {
                if let userLocation = locationViewModel.userLocation {
                    region.center = userLocation.coordinate
                }
            }
    }
}
