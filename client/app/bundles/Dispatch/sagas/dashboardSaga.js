import { call, put, takeEvery } from 'redux-saga/effects';
import {
    TOGGLE_SIDEBAR,
    TOGGLE_SIDEBAR_SUCCEEDED,
    TOGGLE_SIDEBAR_FAILED,
    GET_JOBS,
    GET_JOBS_SUCCEEDED,
    GET_JOBS_FAILED,
    CHANGE_JOB_TOGGLE_STATUS,
    CHANGE_JOB_TOGGLE_STATUS_SUCCEEDED,
    CHANGE_JOB_TOGGLE_STATUS_FAILED,
    REMOVE_JOB_IN_ACTIVE,
    REMOVE_JOB_IN_ACTIVE_SUCCEEDED,
    REMOVE_JOB_IN_ACTIVE_FAILED,
    ADD_TRUCK_TO_LIST,
    ADD_TRUCK_TO_LIST_SUCCEEDED,
    ADD_TRUCK_TO_LIST_FAILED,
    REMOVE_TRUCK_FROM_LIST,
    REMOVE_TRUCK_FROM_LIST_SUCCEEDED,
    REMOVE_TRUCK_FROM_LIST_FAILED,
    ORDER_LIST,
    ORDER_LIST_SUCCEEDED,
    ORDER_LIST_FAILED,
    UPDATE_JOB,
    UPDATE_JOB_SUCCEEDED,
    UPDATE_JOB_FAILED,
    SWITCH_TAB,
    SWITCH_TAB_SUCCEEDED,
    SWITCH_TAB_FAILED,
    GET_AVAILABLE_TRUCKS,
    GET_AVAILABLE_TRUCKS_SUCCEEDED,
    GET_AVAILABLE_TRUCKS_FAILED
} from '../constants/dispatchConstants';
import JobService from '../api/dispatchService';

function* toggleSideBarAsync(action) {
    try {
        yield put({ type: TOGGLE_SIDEBAR_SUCCEEDED, payload: action.payload });
    } catch (e) {
        yield put({ type: TOGGLE_SIDEBAR_FAILED, message: e.message });
    }
}

function* getJobsAsync(action) {
    try {
        const jobs = yield call(JobService.fetchJobs);
        yield put({ type: GET_JOBS_SUCCEEDED, payload: jobs.data.data });
    } catch (e) {
        yield put({ type: GET_JOBS_FAILED, message: e.message });
    }
}

function* changeJobToggleStatusAsync(action) {
    try {
        yield put({ type: CHANGE_JOB_TOGGLE_STATUS_SUCCEEDED, payload: action.payload });
    } catch (e) {
        yield put({ type: CHANGE_JOB_TOGGLE_STATUS_FAILED, message: e.message });
    }
}

function* removeJobInActiveAsync(action) {
    try {
        yield put({ type: REMOVE_JOB_IN_ACTIVE_SUCCEEDED, payload: action.payload });
    } catch (e) {
        yield put({ type: REMOVE_JOB_IN_ACTIVE_FAILED, message: e.message });
    }
}

function* addTruckToListAsync(action) {
    try {
        yield put({ type: ADD_TRUCK_TO_LIST_SUCCEEDED, payload: action.payload });
    } catch (e) {
        yield put({ type: ADD_TRUCK_TO_LIST_FAILED, message: e.message });
    }
}

function* removeTruckFromListAsync(action) {
    try {
        yield put({ type: REMOVE_TRUCK_FROM_LIST_SUCCEEDED, payload: action.payload });
    } catch (e) {
        yield put({ type: REMOVE_TRUCK_FROM_LIST_FAILED, message: e.message });
    }
}

function* orderListAsync(action) {
    try {
        yield put({ type: ORDER_LIST_SUCCEEDED, payload: action.payload });
    } catch (e) {
        yield put({ type: ORDER_LIST_FAILED, message: e.message });
    }
}

function* updateJobAsync(action) {
    try {
        yield put({ type: UPDATE_JOB_SUCCEEDED, payload: action.payload });
    } catch (e) {
        yield put({ type: UPDATE_JOB_FAILED, message: e.message });
    }
}

function* switchTabAsync(action) {
    try {
        yield put({ type: SWITCH_TAB_SUCCEEDED, payload: action.payload });
    } catch (e) {
        yield put({ type: SWITCH_TAB_FAILED, message: e.message });
    }
}

function* getAvailableTrucksAsync(action) {
    try {
        const trucks = yield call(JobService.fetchAvailableTrucks);
        yield put({ type: GET_AVAILABLE_TRUCKS_SUCCEEDED, payload: trucks.data.data });
    } catch (e) {
        yield put({ type: GET_AVAILABLE_TRUCKS_FAILED, message: e.message });
    }
}

export function* watchToggleSideBarAsync() {
    yield takeEvery(TOGGLE_SIDEBAR, toggleSideBarAsync);
}

export function* watchGetJobsAsync() {
    yield takeEvery(GET_JOBS, getJobsAsync);
}

export function* watchChangeJobToggleStatusAsync() {
    yield takeEvery(CHANGE_JOB_TOGGLE_STATUS, changeJobToggleStatusAsync);
}

export function* watchRemoveJobInActiveAsync() {
    yield takeEvery(REMOVE_JOB_IN_ACTIVE, removeJobInActiveAsync);
}

export function* watchAddTruckToListAsync() {
    yield takeEvery(ADD_TRUCK_TO_LIST, addTruckToListAsync);
}

export function* watchRemoveTruckFromListAsync() {
    yield takeEvery(REMOVE_TRUCK_FROM_LIST, removeTruckFromListAsync);
}

export function* watchOrderListAsync() {
    yield takeEvery(ORDER_LIST, orderListAsync);
}

export function* watchUpdateJobAsync() {
    yield takeEvery(UPDATE_JOB, updateJobAsync);
}

export function* watchSwitchTabAsync() {
    yield takeEvery(SWITCH_TAB, switchTabAsync);
}

export function* watchGetAvailableTrucksAsync() {
    yield takeEvery(GET_AVAILABLE_TRUCKS, getAvailableTrucksAsync);
}