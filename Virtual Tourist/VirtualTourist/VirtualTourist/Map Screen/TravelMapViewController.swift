//
//  TravelMapViewController.swift
//  VirtualTourist
//
//  Created by Ariya Behjat on 03/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import CoreData
import EasyCoreData
import MapKit
import UIKit

final class TravelMapViewController : UIViewController {
    let controller = CoreDataController<Pin, PinViewModel>(entityName: "Pin")
    let mapView = MKMapView(frame: .zero)
    var coordinate = CLLocationCoordinate2D()
    
    lazy var longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))

    override func viewDidLoad() {
        super.viewDidLoad()
        controller.fetch()
        setUpMapView()
        setUpLongPressGestureRecognizer()
        addMapAnnotationsOnMap()
        mapView.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUpMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpLongPressGestureRecognizer() {
        longPressRecognizer.minimumPressDuration = 0.5
        longPressRecognizer.delaysTouchesBegan = true
        mapView.addGestureRecognizer(longPressRecognizer)
    }
    
    private func addMapAnnotationsOnMap() {
        (0..<controller.numberOfItems(in: 0))
            .map(toPinViewModel)
            .map(toMapAnnotation)
            .forEach(mapView.addAnnotation)
    }
    
    private func toPinViewModel(_ index: Int) -> PinViewModel {
        controller.getItem(at: IndexPath(item: index, section: 0))
    }
    
    private func toMapAnnotation(_ pin: PinViewModel) -> MKPointAnnotation {
        let coordinate = CLLocationCoordinate2D(
            latitude: Double(pin.latitude),
            longitude: Double(pin.longitude)
        )
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        return annotation
    }
    
    private func savePin(latitude: Double, longitude: Double) {
        let pin = Pin()
        pin.latitude = latitude
        pin.longitude = longitude
        controller.add(model: pin)
    }
    
    private func addAnnotation(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    @objc func handleLongPressGesture() {
        guard longPressRecognizer.state == .began else { return }
        let location = longPressRecognizer.location(in: mapView)
        coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        addAnnotation(coordinate: coordinate)
        savePin(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}

extension TravelMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        if let pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView  {
            pinView.annotation = annotation
            return pinView
        } else {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView.pinTintColor = .red
            return pinView
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        var selectedPinID: NSManagedObjectID? = nil
        if let coordinate = view.annotation?.coordinate {
            for i in (0..<controller.numberOfItems(in: 0)) {
                let ip = IndexPath(item: i, section: 0)
                let pin = controller.getItem(at: ip)
                if pin.coordinate == coordinate {
                    selectedPinID = controller.getItemID(at: ip)
                    break
                }
            }
        }
        
        if let selectedPinID = selectedPinID {
            navigationController?.pushViewController(
                PhotoAlbumViewController(
                    coordinate: coordinate,
                    pinID: selectedPinID
                ),
                animated: true
            )
        }
    }
}
