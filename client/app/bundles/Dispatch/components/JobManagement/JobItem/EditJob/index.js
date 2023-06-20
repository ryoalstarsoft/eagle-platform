import React, { Component } from 'react';
import PropTypes from 'prop-types';
import {
    Button,
    Modal,
    ModalHeader,
    ModalBody,
    ModalFooter,
    Container,
    Row,
    Col,
    Label,
    Input,
    Form,
    FormGroup,
    Dropdown,
    DropdownToggle,
    DropdownMenu,
    DropdownItem
} from 'reactstrap';
import MapContainer from './MapContainer';
import { connect } from 'react-redux';
import { updateJobAction } from '../../../../actions/dispatchActionCreators';
import { COMPLETED_TAB } from '../../../../constants/dispatchConstants';

class EditJob extends Component {
    constructor(props) {
        super(props);

        this.state = {
            optionsOpen: false,
            fields: {
                jobID: this.props.job.job_id,
                customerName: this.props.job.customer_name,
                quarryCodeName: this.props.job.quarry_name,
                material: this.props.job.material,
                jobName: this.props.job.job_site,
                deliveryAddress: this.props.job.quarry_address,
                remarks: this.props.job.quantity,
                truckRate: this.props.job.haul_rate
            },
        };
    }

    toggleOptions = () => {
        this.setState(prevState => ({
            optionsOpen: !prevState.optionsOpen
        }));
    }

    onChange = (e) => {
        let fields = {...this.state.fields};
        fields[e.target.name] = e.target.value;
        this.setState({ fields });
    }

    onUpdate = () => {
        this.props.updateJob(this.state.fields);
        this.props.openEditJobDialog();
    }

    componentDidMount() {
        document.addEventListener('mousedown', this.handleClickOutside);
    }

    componentWillUnmount() {
        document.removeEventListener('mousedown', this.handleClickOutside);
    }

    handleClickOutside = (event) => {
        if (this.state.optionsOpen && this.optionsRef && !this.optionsRef.contains(event.target)) {
            this.toggleOptions();
        }
    }

    render() {
        return (
            <Modal isOpen={this.props.modal} toggle={this.props.openEditJobDialog} className={this.props.className}>
                <div className="left-bar"></div>
                {/* <div className="header-options">
                    <div className="rectangle"></div>
                    <div className="hamburger" onClick={this.toggleOptions}>...</div>
                </div> */}
                <div className="header-options">
                    <Button onClick={this.props.openEditJobDialog} className="btn__close">Close</Button>
                    <Button onClick={this.onUpdate} className="btn__update" disabled={this.props.tabStatus === COMPLETED_TAB ? true: false}>Update</Button>
                </div>
                <ModalHeader toggle={this.props.openEditJobDialog}>
                    {this.props.job.job_id}
                </ModalHeader>
                <ModalBody>
                    <Row>
                        <div className="job-field w-192">
                            <label htmlFor="customerName">Customer Name</label>
                            <span name="customerName" id="customerName">{this.props.job.customer_name}</span>
                        </div>
                        <div className="job-field w-192">
                            <label htmlFor="quarryCodeName">Quarry Code Name</label>
                            <span name="quarryCodeName" id="quarryCodeName">{this.props.job.quarry_name}</span>
                        </div>
                        <div className="job-field w-192">
                            <label htmlFor="material">Material</label>
                            <span name="material" id="material">{this.props.job.material}</span>
                        </div>
                        <div className="job-field w-192">
                            <label htmlFor="jobName">Job Name</label>
                            <span name="jobName" id="jobName">{this.props.job.job_site}</span>
                        </div>
                    </Row>
                    <Row>
                        <div className="job-field w-402">
                            <label htmlFor="deliveryAddress">Delivery Address</label>
                            <span name="deliveryAddress" id="deliveryAddress">{this.props.job.quarry_address}</span>
                        </div>
                        <div className="job-field w-192">
                            <label htmlFor="remarks">Remarks</label>
                            <input type="text" name="remarks" id="remarks" onChange={this.onChange} defaultValue={this.props.job.quantity} disabled={this.props.tabStatus === COMPLETED_TAB ? true : false} />
                        </div>
                        <div className="job-field w-192">
                            <label htmlFor="truckRate">Truck Rate</label>
                            <span name="truckRate" id="truckRate">{this.props.job.haul_rate}</span>
                        </div>
                    </Row>
                    <Row>
                        <div className="job-field w-192">
                            <label htmlFor="totalMiles">Total Miles</label>
                            <span name="totalMiles" id="totalMiles">35.16</span>
                        </div>
                        <div className="job-field w-612">
                            <label htmlFor="Trucks">Trucks</label>
                            <div name="trucks" id="trucks">
                                {this.props.trucks.map((n, i) => (
                                    <div className="job-number" key={i}>
                                        {n}
                                    </div>
                                ))}
                            </div>
                        </div>
                    </Row>
                    <Row className="map-container">
                        <MapContainer
                            address={this.state.fields.deliveryAddress}
                            lat={this.props.job.quarry_latitude}
                            lng={this.props.job.quarry_longitude} />
                    </Row>
                </ModalBody>
                <div className={`${this.state.optionsOpen ? 'options-dropdown' : 'd-none'}`} ref={node => this.optionsRef = node}>
                    <p className="options-item">View Order</p>
                    <p className="options-item">Edit Order</p>
                    <p className="options-item">Cancel Order</p>
                </div>
            </Modal>
        );
    }
}

EditJob.propTypes = {
    modal: PropTypes.bool.isRequired,
    openEditJobDialog: PropTypes.func.isRequired,
    trucks: PropTypes.array.isRequired,
    job: PropTypes.object.isRequired,
    updateJob: PropTypes.func.isRequired,
    tabStatus: PropTypes.number.isRequired
};

const mapStateToProps = state => ({
    tabStatus: state.dispatch.tabStatus
});

const mapDispatchToProps = dispatch => ({
    updateJob: (fields) => dispatch(updateJobAction(fields))
});

export default connect(mapStateToProps, mapDispatchToProps)(EditJob);