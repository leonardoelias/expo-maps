import MapKit

public final class AppleMapsView: UIView, ExpoMapView {
  
  private let mapView: MKMapView
  private let delegate: MKMapViewDelegate
  private let markers: AppleMapsMarkers
  private let gestures: AppleMapsGestures
  private let polygons: AppleMapsPolygons
  private let polylines: AppleMapsPolylines
  
  init() {
    mapView = MKMapView()
    mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    delegate = AppleMapsViewDelegate()
    mapView.delegate = delegate
    markers = AppleMapsMarkers(mapView: mapView)
    gestures = AppleMapsGestures(mapView: mapView)
    polygons = AppleMapsPolygons(mapView: mapView)
    polylines = AppleMapsPolylines(mapView: mapView)

    super.init(frame: CGRect.zero)
    addSubview(mapView)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setEnabledRotateGestures(enabled: Bool) {
    gestures.setEnabledRotateGesture(enabled: enabled)
  }

  func setEnabledScrollGestures(enabled: Bool) {
    gestures.setEnabledScrollGesture(enabled: enabled)
  }

  func setEnabledTiltGestures(enabled: Bool) {
    gestures.setEnabledTiltGesture(enabled: enabled)
  }

  func setEnabledZoomGestures(enabled: Bool) {
    gestures.setEnabledZoomGesture(enabled: enabled)
  }
  
  func setMapType(mapType: MapType) {
    var mapViewType: MKMapType
    switch mapType {
    case .hybrid:
      mapViewType = .hybrid
    case .satellite:
      mapViewType = .satellite
    case .normal, .terrain:
      mapViewType = .standard
    }
    mapView.mapType = mapViewType
  }
  
  func setMarkers(markerObjects: [MarkerObject]) {
    markers.setMarkers(markerObjects: markerObjects)
  }
  
  func setPolygons(polygonObjects: [PolygonObject]) {
    polygons.setPolygons(polygonObjects: polygonObjects)
  }
  
  func setPolylines(polylineObjects: [PolylineObject]) {
    polylines.setPolylines(polylineObjects: polylineObjects)
  }
}
