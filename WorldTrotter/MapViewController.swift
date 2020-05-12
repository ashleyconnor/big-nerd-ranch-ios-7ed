//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Ashley Connor on 02/05/2020.
//  Copyright © 2020 Rublix. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func loadView() {
        mapView = MKMapView()
        mapView.delegate = self
        
        view = mapView
        
        let segementedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segementedControl.backgroundColor = UIColor.systemBackground
        segementedControl.selectedSegmentIndex = 0
        
        segementedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segementedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segementedControl)
        
        let topConstraint = segementedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)

        let margins = view.layoutMarginsGuide
        let leadingConstraint = segementedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segementedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        let pointsOfInterestLabel = UILabel()
        let pointsOfInterestToggle = UISwitch()
        
        pointsOfInterestLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsOfInterestToggle.translatesAutoresizingMaskIntoConstraints = false
        
        pointsOfInterestLabel.text = "Points of Interest"
        pointsOfInterestToggle.isOn = true
        pointsOfInterestToggle.addTarget(self, action: #selector(togglePOI(_:)), for: .valueChanged)
        
        view.addSubview(pointsOfInterestLabel)
        view.addSubview(pointsOfInterestToggle)
        
        let labelTopConstraint = pointsOfInterestLabel.topAnchor.constraint(equalTo: segementedControl.bottomAnchor, constant: 8)
        let labelLeadingConstraint = pointsOfInterestLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        let togglelTopConstraint = pointsOfInterestToggle.topAnchor.constraint(equalTo: segementedControl.bottomAnchor, constant: 8)
        let toggleLeadingConstraint = pointsOfInterestToggle.leadingAnchor.constraint(equalTo: pointsOfInterestLabel.trailingAnchor)
        
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
        togglelTopConstraint.isActive = true
        toggleLeadingConstraint.isActive = true

        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()

        mapView.showsUserLocation = true
    }


    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(viewRegion, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func togglePOI(_ toggle: UISwitch) {
        if toggle.isOn {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
        } else {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
        }
    }
}
