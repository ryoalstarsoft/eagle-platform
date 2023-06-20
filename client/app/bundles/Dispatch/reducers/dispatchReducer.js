import { handleActions } from 'redux-actions';
import {
    TOGGLE_SIDEBAR_SUCCEEDED,
    GET_JOBS_SUCCEEDED,
    CHANGE_JOB_TOGGLE_STATUS_SUCCEEDED,
    REMOVE_JOB_IN_ACTIVE_SUCCEEDED,
    ADD_TRUCK_TO_LIST_SUCCEEDED,
    REMOVE_TRUCK_FROM_LIST_SUCCEEDED,
    ORDER_LIST_SUCCEEDED,
    UPDATE_JOB_SUCCEEDED,
    SWITCH_TAB_SUCCEEDED,
    GET_AVAILABLE_TRUCKS_SUCCEEDED,
    ACTIVE_TAB,
} from '../constants/dispatchConstants';
import { arrayMove } from 'react-sortable-hoc';

const initialState = {
    showSideBar: false,
    jobs: [],
    jobToggleStatus: {},
    errors: {},
    trucks: [],
    trucksCount: {},
    tabStatus: ACTIVE_TAB
};

const dispatchReducer = handleActions(
    {
        [TOGGLE_SIDEBAR_SUCCEEDED]: (state, action) => ({
            ...state,
            showSideBar: action.payload
        }),
        [GET_JOBS_SUCCEEDED]: (state, action) => ({
            ...state,
            jobs: action.payload
        }),
        [CHANGE_JOB_TOGGLE_STATUS_SUCCEEDED]: (state, action) => {
            let tmp = state.jobToggleStatus;
            tmp[action.payload.jobID] = action.payload.status;

            return {
                ...state,
                jobToggleStatus: tmp
            };
        },
        [REMOVE_JOB_IN_ACTIVE_SUCCEEDED]: (state, action) => {
            let status = state.jobToggleStatus;

            let tmp = state.jobs.map((job, i) => {
                if (job.job_id === action.payload) {
                    job.status = "completed";
                    delete status[job.job_id];
                }
                return job;
            });

            return {
                ...state,
                jobs: tmp,
                jobToggleStatus: status
            };
        },
        [ADD_TRUCK_TO_LIST_SUCCEEDED]: (state, action) => {
            let trucks = state.trucks;
            let trucksCount = state.trucksCount;

            let tmp = state.jobs.map((job, i) => {
                if (job.job_id === action.payload.job_id) {
                    if (job.dispatched_trucks.indexOf(action.payload.number) === -1) {
                        job.dispatched_trucks.push(action.payload.number);
                        if (trucksCount[action.payload.number] == undefined)
                            trucksCount[action.payload.number] = 0;

                        trucksCount[action.payload.number] += 1;
                        // let index = trucks.indexOf(action.payload.number);
                        // trucks.splice(index, 1);
                    }
                }
                return job;
            });

            return {
                ...state,
                jobs: tmp,
                trucks: trucks
            }
        },
        [REMOVE_TRUCK_FROM_LIST_SUCCEEDED]: (state, action) => {
            let trucks = state.trucks;
            let trucksCount = state.trucksCount;

            let tmp = state.jobs.map((job, i) => {
                if (job.job_id === action.payload.job_id) {
                    // trucks.push(action.payload.number);
                    let index = job.dispatched_trucks.indexOf(action.payload.number);
                    job.dispatched_trucks.splice(index, 1);

                    trucksCount[action.payload.number]--;
                }
                return job;
            });

            return {
                ...state,
                jobs: tmp,
                trucks: trucks
            }
        },
        [ORDER_LIST_SUCCEEDED]: (state, action) => {
            return {
                ...state,
                jobs: arrayMove(state.jobs, action.payload.oldIndex, action.payload.newIndex)
            };
        },
        [UPDATE_JOB_SUCCEEDED]: (state, action) => {
            let tmp = state.jobs.map((job, i) => {
                if (job.job_id === action.payload.jobID) {
                    job.customer_name = action.payload.customerName;
                    job.quarry_name = action.payload.quarryCodeName;
                    job.quarry_address = action.payload.deliveryAddress;
                    job.material = action.payload.material;
                    job.job_site = action.payload.jobName;
                    job.haul_rate = action.payload.truckRate;
                    job.quantity =  action.payload.remarks;
                }

                return job;
            });

            return {
                ...state,
                jobs: tmp
            }
        },
        [SWITCH_TAB_SUCCEEDED]: (state, action) => ({
            ...state,
            tabStatus: action.payload
        }),
        [GET_AVAILABLE_TRUCKS_SUCCEEDED]: (state, action) => ({
            ...state,
            trucks: action.payload
        })
    },
    initialState
);

export default dispatchReducer;