import axios from 'axios';

const API_DOMAIN = process.env.REACT_APP_API_DOMAIN;
const API_VERSION = process.env.REACT_APP_API_VERSION;

export default {
  fetchJobs: () => {
    return axios.get(API_DOMAIN + API_VERSION + '/dispatch.json', { crossdomain: true });
  },
  fetchAvailableTrucks: () => {
    return axios.get(API_DOMAIN + API_VERSION + '/trucks.json', { crossdomain: true });
  }
}