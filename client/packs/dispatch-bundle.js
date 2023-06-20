import ReactOnRails from 'react-on-rails';

import DispatchApp from '../app/bundles/Dispatch/startup/DispatchApp';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  DispatchApp,
});
