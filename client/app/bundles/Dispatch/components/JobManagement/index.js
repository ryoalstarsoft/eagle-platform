import React, { Component } from 'react';
import PropTypes from 'prop-types';
import JobItem from './JobItem';
import { getJobsAction, getAvailableTrucksAction } from '../../actions/dispatchActionCreators';
import { connect } from 'react-redux';
import { Table } from 'reactstrap';
import {
  SortableContainer,
  SortableElement,
  arrayMove,
} from 'react-sortable-hoc';
import { ACTIVE_TAB, COMPLETE_TAB } from '../../constants/dispatchConstants';

class JobManagement extends Component {
  constructor(props) {
    super(props);

    this.state = {
      jobToggleStatus: [],
      jobs: []
    };

    this.applyToggleStatus = this.applyToggleStatus.bind(this);
  }

  componentDidMount() {
    this.props.getAvailableTrucks();
  }

  componentWillReceiveProps(prevProps, prevState) {
    // if (prevProps.tabStatus === ACTIVE_TAB) {
    //     debugger;
    //     this.setState({
    //         jobs: prevProps.jobs.filter(job => job.status === "active").filter(job => job.job_id.toString().indexOf(prevProps.searchTerm) !== -1
    //             || job.customer_name.toLowerCase().indexOf(prevProps.searchTerm.toLowerCase()) !== -1
    //             || prevProps.trucks.includes(Number(prevProps.searchTerm))
    //             || job.dispatched_trucks.includes(Number(prevProps.searchTerm))) });
    // } else if (prevProps.tabStatus === COMPLETED_TAB) {
    //     this.setState({
    //         jobs: prevProps.jobs.filter(job => job.status === "completed").filter(job => job.job_id.toString().indexOf(prevProps.searchTerm) !== -1
    //             || job.customer_name.toLowerCase().indexOf(prevProps.searchTerm.toLowerCase()) !== -1
    //             || prevProps.trucks.includes(Number(prevProps.searchTerm))
    //             || job.dispatched_trucks.includes(Number(prevProps.searchTerm)))
    //             .filter(job => new Date(job.date) >= prevProps.startDate
    //                 && new Date(job.date) <= prevProps.endDate) });
    // }

    // console.log(this.state.jobs);
    // console.log(this.props);
    // console.log(prevProps);
  }

  applyToggleStatus(jts) {
    this.setState({ jobToggleStatus: jts });
  }

  render() {
    let jts = this.state.jobToggleStatus;
    let dd = {
      opacity: 1 + ' !important',
      zIndex: 100
    };

    return (
      <div className="job-management-container">
        <Table>
          <tbody>
            {
              this.props.tabStatus === ACTIVE_TAB ?
                this.props.jobs.filter(job => job.status === "active").filter(job => job.job_id.toString().indexOf(this.props.searchTerm) !== -1
                || job.customer_name.toLowerCase().indexOf(this.props.searchTerm.toLowerCase()) !== -1
                || this.props.trucks.includes(Number(this.props.searchTerm))
                || job.dispatched_trucks.includes(Number(this.props.searchTerm))).map((job, i) => {
                let isAllMinus = true;

                for (let key in jts) {
                  if (jts[key] === true) {
                    isAllMinus = false;
                    break;
                  }
                }

                return <JobItem
                    key={job.job_id}
                    job={job}
                    index={i}
                    showTruckList={jts[job.job_id]}
                    idx={i}
                    trucks={this.props.trucks}
                    className={isAllMinus ? 'o-100' : ''}
                    hasSearchKeyword={this.props.searchTerm.length === 0 ? false : true}
                    applyToggleStatus={this.applyToggleStatus}
                    isSorting={this.props.isSorting}
                    status={this.props.status} />;
              }) :
                this.props.jobs.filter(job => job.status === "completed").filter(job => job.job_id.toString().indexOf(this.props.searchTerm) !== -1
                || job.customer_name.toLowerCase().indexOf(this.props.searchTerm.toLowerCase()) !== -1
                || this.props.trucks.includes(Number(this.props.searchTerm))
                || job.dispatched_trucks.includes(Number(this.props.searchTerm)))
                .filter(job => new Date(job.date) >= this.props.startDate
                  && new Date(job.date) <= this.props.endDate).map((job, i) => {
                  let isAllMinus = true;

                  for (let key in jts) {
                    if (jts[key] === true) {
                      isAllMinus = false;
                      break;
                    }
                  }

                  return <JobItem
                    key={job.job_id}
                    job={job}
                    index={i}
                    showTruckList={jts[job.job_id]}
                    idx={i}
                    trucks={this.props.trucks}
                    isSorting={this.props.isSorting}
                    className={isAllMinus ? 'o-100' : ''}
                    applyToggleStatus={this.applyToggleStatus}
                    hasSearchKeyword={this.props.searchTerm.length === 0 ? false : true}
                    status={this.props.status} />;
                })
            }
          </tbody>
        </Table>
      </div>
    );
  }
}

JobManagement.propTypes = {
  jobs: PropTypes.array.isRequired,
  jobToggleStatus: PropTypes.object.isRequired,
  status: PropTypes.number.isRequired,
  searchTerm: PropTypes.string.isRequired,
  startDate: PropTypes.object.isRequired,
  endDate: PropTypes.object.isRequired,
  tabStatus: PropTypes.number.isRequired,
  getAvailableTrucks: PropTypes.func.isRequired,
  trucks: PropTypes.array.isRequired,
  isSorting: PropTypes.bool.isRequired
}

const mapStateToProps = state => ({
  jobToggleStatus: state.dispatch.jobToggleStatus,
  tabStatus: state.dispatch.tabStatus,
  trucks: state.dispatch.trucks
});

const mapDispatchToProps = dispatch => ({
  getAvailableTrucks: () => dispatch(getAvailableTrucksAction())
});

export default connect(mapStateToProps, mapDispatchToProps)(SortableContainer(JobManagement));
