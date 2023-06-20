import React, { Component } from "react";
import PropTypes from 'prop-types';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBars, faList } from '@fortawesome/free-solid-svg-icons';
import dashboardNormal from '../assets/images/dashboard_normal.png';
import dashboardClick from '../assets/images/dashboard_click.png';
import { connect } from 'react-redux';
import { toggleSideBarAction } from '../actions/dispatchActionCreators';

class Header extends Component {
  constructor(props) {
    super(props);

    this.toggleSideBar = this.toggleSideBar.bind(this);
  }

  toggleSideBar() {
    this.props.toggleSideBar(!this.props.showSideBar);
  }

  componentDidMount() {
    this.props.toggleSideBar(false);
  }

  render() {
    return (
      <div className="d-flex header-container">
        <header className="d-flex">
          <div className="header-left-block">
            <span>Haul&nbsp;</span>
            <span>/ Dispatch</span>
          </div>
          <div className="header-right-block">
            <ul>
              <li><span>View:</span></li>
              <li>
                <FontAwesomeIcon className="fa-my-list" color="#E3E3E3" icon={faList} />
                <span data-type="aw-label">Standard</span>
              </li>
              <li>
                <img src={dashboardClick} className="fa-my-dashboard" alt="Dashboard" width={25} />
                <span data-type="aw-label">Dashboard</span>
              </li>
            </ul>
          </div>
        </header>
      </div>
    );
  }
}

Header.propTypes = {
  showSideBar: PropTypes.bool.isRequired,
  toggleSideBar: PropTypes.func.isRequired
}

const mapStateToProps = state => ({
  showSideBar: state.dispatch.showSideBar
});

const mapDispatchToProps = dispatch => ({
  toggleSideBar: (status) => dispatch(toggleSideBarAction(status))
});

export default connect(mapStateToProps, mapDispatchToProps)(Header);