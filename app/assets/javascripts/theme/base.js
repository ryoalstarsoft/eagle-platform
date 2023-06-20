//** CORE
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require popper
//= require bootstrap-sprockets

//= require simplebar.min.js

//= require dom-factory.js
//= require material-design-kit.js

//** PLUGIN SCRIPTS (NODE_MODULES)
//= require jquery.mask.min.js
//= require select2.min.js

//= require moment.min.js
//= require moment-range.js

//= require chart.min.js
//= require flatpickr.min.js

//= require jquery.vmap.min.js
//= require jquery.vmap.world.js

//= require ./vector-maps/mall-map.js
//= require ./vector-maps/gdp-data.js

//= require dropzone.js
//= require list.min.js
//= require toastr.js
//= require dragula.min.js
//= require fullcalendar.min.js
//= require quill.min.js
//= require daterangepicker.js
//= require bootstrap-editable.min.js

//** APP SETTINGS
//= require ./application.js
//= require ./settings.js

//** PLUGIN WRAPPERS & INITS
//= require ./plugins/chartjs-rounded-bar.js
//= require ./plugins/charts.js
//= require ./plugins/daterangepicker.js
//= require ./plugins/dragula.js
//= require ./plugins/dropzone.js
//= require ./plugins/flatpickr.js
//= require ./plugins/fullcalendar.js
//= require ./plugins/list.js
//= require ./plugins/quill.js
//= require ./plugins/select2.js
//= require ./plugins/toastr.js
//= require ./plugins/vector-maps.js

window['moment-range'].extendMoment(moment);