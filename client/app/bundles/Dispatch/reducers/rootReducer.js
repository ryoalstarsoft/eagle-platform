import { combineReducers } from 'redux';
import dispatchReducer from './dispatchReducer';

const reducers = combineReducers({
    dispatch: dispatchReducer
});

export default reducers;
