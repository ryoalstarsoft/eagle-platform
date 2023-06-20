import React, { Component } from 'react';
import { withRouter, Redirect } from 'react-router-dom';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import {
  changeJobToggleStatusAction,
  removeJobInActiveAction,
  addTruckToListAction,
  removeTruckFromListAction
} from '../../../actions/dispatchActionCreators';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlusSquare, faCheck } from '@fortawesome/free-solid-svg-icons';
import faPlus from '../../../assets/images/plus-symbol-in-a-rounded-black-square.png';
import faPlusDisabled from '../../../assets/images/disabled-plus-symbol-in-a-rounded-black-square.png';
import faMinus from '../../../assets/images/minus-sign-inside-a-black-circle.png';
import EditJob from './EditJob';
import { ACTIVE_TAB, COMPLETED_TAB } from '../../../constants/dispatchConstants';
import {
  SortableContainer,
  SortableElement,
  arrayMove,
} from 'react-sortable-hoc';

class JobItem extends Component {
  constructor(props) {
    super(props);

    this.state = {
      showTruckList: this.props.showTruckList,
      truckStatusList: [],
      modal: false,
      checked: false
    };

    this.toggleSideBar = this.toggleSideBar.bind(this);
    this.toggleTruckList = this.toggleTruckList.bind(this);
    this.addTruck = this.addTruck.bind(this);
    this.removeTruck = this.removeTruck.bind(this);
    this.openEditJobDialog = this.openEditJobDialog.bind(this);
    this.setJobToComplete = this.setJobToComplete.bind(this);
    this.onClickAddress = this.onClickAddress.bind(this);

    this.truckElements = [];
  }

  onClickAddress() {
    window.open("https://www.google.com/maps/place/" + this.props.job.quarry_address, '_blank');
  }

  setJobToComplete() {
    this.setState({ checked: true });

    setTimeout(() => {
      this.props.removeJobInActive(this.props.job.job_id);
    }, 300);
  }

  openEditJobDialog() {
    this.setState({
      modal: !this.state.modal
    });
  }

  toggleSideBar() {

  }

  toggleTruckList() {
    this.setState({ showTruckList: !this.state.showTruckList }, () => {
      this.props.changeJobToggleStatus(this.props.job.job_id, this.state.showTruckList);
      this.props.applyToggleStatus(this.props.jobToggleStatus);
    });
  }

  componentDidMount() {

  }

  addTruck(n, i) {
    // this.truckElements[i].style.color = '#626269';
    // this.truckElements[i].style.borderColor = '#626269';

    this.props.addTruckToList(this.props.job.job_id, n);
  }

  removeTruck(n, i) {
    // this.truckElements[i].style.color = '#626269';
    // this.truckElements[i].style.borderColor = '#626269';

    this.props.removeTruckFromList(this.props.job.job_id, n);
  }

  render() {
    const grey = {
      color: '#626269',
      border: '1px solid #626269'
    };

    const yellow = {
      color: '#CFD15D',
      border: '1px solid #CFD15D'
    };

    const red = {
      color: '#FF0000',
      border: '1px solid #FF0000'
    };

    if (this.props.status === ACTIVE_TAB) {
      return (
        <React.Fragment>
          <tr className={`${this.props.isSorting ? 'dragging' : ''} ${!this.state.showTruckList ? '' : 'o-100'} ${this.props.hasSearchKeyword ? 'o-100' : ''} ${this.props.className}`}>
            <th scope="active" className={`${this.props.job.dispatched_trucks.length > 0 && !this.state.showTruckList ? 'trucks-added' : ''}`} onClick={this.openEditJobDialog}>{this.props.job.job_id}</th>
            <td>{this.props.job.quarry_name}</td>
            <td onClick={this.onClickAddress}>{this.props.job.quarry_address}</td>
            <td>{this.props.job.material}</td>
            <td>{this.props.job.customer_name}</td>
            <td>{this.props.job.job_site}</td>
            <td>{this.props.job.quantity}</td>
            <td>{this.props.job.haul_rate}</td>
            <td>35.16</td>
            <td>
              <div className="job-list">
                <div className="add-trucks">
                  {/* <FontAwesomeIcon className="fa-my-plus-square" color="#E3E3E3" icon={faPlusSquare} onClick={this.toggleSideBar} /> */}
                  {!this.state.showTruckList ?
                    <img src={faPlus} className="fa-my-plus-square" alt="Plus Square" width={20} height={20} onClick={this.toggleTruckList} />
                    : <FontAwesomeIcon className="fa-my-check" icon={faCheck} onClick={this.toggleTruckList} />
                  }
                </div>
                <div className="job-item">
                  {this.props.job.dispatched_trucks.map((n, i) => {
                    let style = {};

                    if (this.props.trucksCount[n] === 1)
                      style = {
                        backgroundColor: '#626269',
                        border: '1px solid #626269'
                      };
                    else if (this.props.trucksCount[n] === 2)
                      style = {
                        backgroundColor: '#CFD15D',
                        border: '1px solid #CFD15D'
                      };
                    else if (this.props.trucksCount[n] > 2)
                      style = {
                        backgroundColor: '#FF0000',
                        border: '1px solid #FF0000'
                      };

                    return <div
                      className="job-number"
                      onClick={() => this.removeTruck(n, i)}
                      key={i}>
                      {n}
                    </div>;
                  })}
                </div>
              </div>
            </td>
            <td>
              <div onClick={this.setJobToComplete} className={`${this.state.checked ? 'checked' : ''}`}></div>
            </td>
          </tr>
          <tr className={`${!this.state.showTruckList ? 'd-none' : ''} truck-section ${this.props.className}`}>
            <th colSpan="11">
              <div className="truck-list">
                <div className={`${this.props.job.dispatched_trucks.length > 0 ? 'threedot' : ''}`}>
                  <div></div>
                  <div></div>
                  <div></div>
                </div>
                <div className="d-flex-wrap">
                  {this.props.trucks.map((n, i) => {
                    let style = {};

                    if (this.props.trucksCount[n] === 1)
                      style = grey;
                    else if (this.props.trucksCount[n] === 2)
                      style = yellow;
                    else if (this.props.trucksCount[n] > 2)
                      style = red;

                    return <div
                      className="truck-number"
                      onClick={() => this.addTruck(n, i)}
                      ref={node => this.truckElements[i] = node}
                      style={style}
                      key={i}>
                      {n}
                    </div>;
                  })}
                </div>
              </div>
            </th>
          </tr>
          <EditJob
            className="edit-job-modal"
            modal={this.state.modal}
            trucks={this.props.job.dispatched_trucks}
            job={this.props.job}
            openEditJobDialog={this.openEditJobDialog} />
        </React.Fragment>
      );
    } else if (this.props.status === COMPLETED_TAB) {
      return (
        <React.Fragment>
          <tr className={`${this.props.className}`}>
            <th scope="completed" onClick={this.openEditJobDialog}>{this.props.job.job_id}</th>
            <td>{this.props.job.quarry_name}</td>
            <td>{this.props.job.quarry_address}</td>
            <td>{this.props.job.material}</td>
            <td>{this.props.job.customer_name}</td>
            <td>{this.props.job.job_site}</td>
            <td>{this.props.job.quantity}</td>
            <td>{this.props.job.haul_rate}</td>
            <td>35.16</td>
            <td>
              <div className="job-list">
                <div className="add-trucks">
                  {/* <FontAwesomeIcon className="fa-my-plus-square" color="#E3E3E3" icon={faPlusSquare} onClick={this.toggleSideBar} /> */}
                  <img src={faPlusDisabled} className="fa-my-plus-square-disabled" alt="Plus Square Disabled" width={20} height={20} />
                </div>
                <div className="job-item">
                  {this.props.job.dispatched_trucks.map((n, i) => (
                    <div className="job-number" key={i}>
                      {n}
                    </div>
                  ))}
                </div>
              </div>
            </td>
            <td>
              <div></div>
            </td>
          </tr>
          <EditJob
            className="edit-job-modal"
            modal={this.state.modal}
            trucks={this.props.job.dispatched_trucks}
            job={this.props.job}
            openEditJobDialog={this.openEditJobDialog} />
        </React.Fragment>
      );
    }
  }
}

JobItem.propTypes = {
  job: PropTypes.object.isRequired,
  idx: PropTypes.number.isRequired,
  jobToggleStatus: PropTypes.object.isRequired,
  changeJobToggleStatus: PropTypes.func.isRequired,
  removeJobInActive: PropTypes.func.isRequired,
  addTruckToList: PropTypes.func.isRequired,
  removeTruckFromList: PropTypes.func.isRequired,
  applyToggleStatus: PropTypes.func.isRequired,
  className: PropTypes.string.isRequired,
  status: PropTypes.number.isRequired,
  hasSearchKeyword: PropTypes.bool.isRequired,
  trucks: PropTypes.array.isRequired,
  trucksCount: PropTypes.object.isRequired,
  showTruckList: PropTypes.bool.isRequired,
  isSorting: PropTypes.bool.isRequired
}

JobItem.defaultProps = {
  status: ACTIVE_TAB,
  hasSearchKeyword: false,
  showTruckList: false
}

const mapStateToProps = state => ({
  jobToggleStatus: state.dispatch.jobToggleStatus,
  trucksCount: state.dispatch.trucksCount
});

const mapDispatchToProps = dispatch => ({
  changeJobToggleStatus: (jobID, status) => dispatch(changeJobToggleStatusAction({ jobID: jobID, status: status })),
  removeJobInActive: (id) => dispatch(removeJobInActiveAction(id)),
  addTruckToList: (job_id, number) => dispatch(addTruckToListAction({ job_id: job_id, number: number })),
  removeTruckFromList: (job_id, number) => dispatch(removeTruckFromListAction({ job_id: job_id, number: number }))
});

export default connect(mapStateToProps, mapDispatchToProps)(withRouter(SortableElement(JobItem)));
