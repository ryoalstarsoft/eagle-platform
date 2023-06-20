import { all, fork } from 'redux-saga/effects';
import * as dashboardSaga from './dashboardSaga';

// notice how we now only export the rootSaga
// single entry point to start all Sagas at once
export default function* dispatchSaga() {
    yield all([
        fork(dashboardSaga.watchToggleSideBarAsync),
        fork(dashboardSaga.watchGetJobsAsync),
        fork(dashboardSaga.watchChangeJobToggleStatusAsync),
        fork(dashboardSaga.watchRemoveJobInActiveAsync),
        fork(dashboardSaga.watchAddTruckToListAsync),
        fork(dashboardSaga.watchRemoveTruckFromListAsync),
        fork(dashboardSaga.watchOrderListAsync),
        fork(dashboardSaga.watchUpdateJobAsync),
        fork(dashboardSaga.watchSwitchTabAsync),
        fork(dashboardSaga.watchGetAvailableTrucksAsync)
    ]);
}