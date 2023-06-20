import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Map, GoogleApiWrapper, InfoWindow, Marker } from 'google-maps-react';
import Geocode from 'react-geocode';

const mapStyles = {
    width: '100%',
    height: '375px',
};

Geocode.setApiKey(process.env.REACT_APP_GOOGLE_MAP_API_KEY);

// Enable or disable logs. Its optional.
Geocode.enableDebug();

class MapContainer extends Component {
    constructor(props) {
        super(props);

        this.state = {
            showingInfoWindow: false,  //Hides or the shows the infoWindow
            activeMarker: {},          //Shows the active marker upon click
            selectedPlace: {},          //Shows the infoWindow to the selected place upon a marker
            location: {
                lat: this.props.lat,
                lng: this.props.lng
            }
        };
    }

    onMarkerClick = (props, marker, e) =>
        this.setState({
            selectedPlace: props,
            activeMarker: marker,
            showingInfoWindow: true
        });

    onClose = props => {
        if (this.state.showingInfoWindow) {
            this.setState({
                showingInfoWindow: false,
                activeMarker: null
            });
        }
    };

    componentDidMount() {
        Geocode.fromAddress(this.props.address).then(response => {
            const {
                lat,
                lng
            } = response.results[0].geometry.location;
            console.log(lat, lng);

            this.setState({
                location: {
                    lat: lat,
                    lng: lng
                }
            });
        },
        error => {
            console.error(error);
        });
    }

    render() {
        const points = [{
            lat: 42.02,
            lng: -77.01
        },
        {
            lat: 42.03,
            lng: -77.02
        },
        {
            lat: 41.03,
            lng: -77.04
        },
        {
            lat: 42.05,
            lng: -77.02
        }
        ];

        let bounds = new this.props.google.maps.LatLngBounds();
        for (let i = 0; i < points.length; i++) {
            bounds.extend(points[i]);
        }

        return (
            <Map
                google={this.props.google}
                zoom={14}
                style={mapStyles}
                initialCenter={{
                    lat: this.state.location.lat,
                    lng: this.state.location.lng
                }}
            >
                <Marker
                    onClick={this.onMarkerClick}
                    name={this.props.address}
                />
                <InfoWindow
                    marker={this.state.activeMarker}
                    visible={this.state.showingInfoWindow}
                    onClose={this.onClose}
                >
                    <div>
                        <h4>{this.state.selectedPlace.name}</h4>
                    </div>
                </InfoWindow>
            </Map>
        );
    }
}

MapContainer.propTypes = {
    address: PropTypes.string.isRequired,
    lng: PropTypes.number.isRequired,
    lat: PropTypes.number.isRequired
};

export default GoogleApiWrapper({
    apiKey: process.env.REACT_APP_GOOGLE_MAP_API_KEY
})(MapContainer);