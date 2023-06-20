import { connect } from 'react-redux';
import Dispatch from '../components/Dispatch';
import * as actions from '../actions/dispatchActionCreators';

// Which part of the Redux global state does our component want to receive as props?
const mapStateToProps = (state) => ({ 
  showSideBar: state.dispatch.showSideBar
});

// See https://github.com/reactjs/react-redux/blob/master/docs/api.md#examples
export default connect(mapStateToProps, actions)(Dispatch);
