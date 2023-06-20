import { createStore, applyMiddleware, compose } from 'redux';
import rootReducer from '../reducers/rootReducer';

import createSagaMiddleware from 'redux-saga';
import createHistory from 'history/createBrowserHistory';
import { routerMiddleware } from 'react-router-redux';
import sagas from '../sagas/dispatchSaga';

const sagaMiddleware = createSagaMiddleware();
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

export const history = createHistory();

const initialState = {};
const middleware = [
    routerMiddleware(history),
    sagaMiddleware
];

// TODO (if needed)
// Passing of props were not working!
// const configureStore = (railsProps) => (
//   createStore(
//     dispatchReducer,
//     initialState,
//     composeEnhancers(applyMiddleware(sagaMiddleware))
//   )
// );
const configureStore = createStore(
  rootReducer,
  initialState,
  composeEnhancers(applyMiddleware(...middleware))
);

sagaMiddleware.run(sagas);

export default configureStore;
