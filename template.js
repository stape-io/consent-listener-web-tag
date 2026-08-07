const addConsentListener = require('addConsentListener');
const callLater = require('callLater');
const createQueue = require('createQueue');
const getType = require('getType');
const getUrl = require('getUrl');
const isConsentGranted = require('isConsentGranted');

/*==============================================================================
==============================================================================*/

if (shouldExitEarly(data)) return data.gtmOnSuccess();

const typesToListen = getUserConsentTypesSelection(data);

addConsentStatusListener(data, typesToListen);

return data.gtmOnSuccess();

/*==============================================================================
==============================================================================*/

function getUserConsentTypesSelection(data) {
  const allConsentTypes = [
    'ad_storage',
    'ad_user_data',
    'ad_personalization',
    'analytics_storage',
    'functionality_storage',
    'personalization_storage',
    'security_storage'
  ];

  if (data.monitoredConsentScope === 'allTypes') return allConsentTypes;
  else {
    return data.specificConsentTypes.map((d) => d.consentType);
  }
}

function addConsentStatusListener(data, typesToListen) {
  const dataLayerName =
    data.useCustomDataLayer && data.customDataLayerName ? data.customDataLayerName : 'dataLayer';
  const dataLayerDispatcher = createQueue(dataLayerName);

  let flushScheduled = false;
  function flushConsentState() {
    flushScheduled = false;

    const consentState = {};
    typesToListen.forEach((consentType) => {
      consentState[consentType] = isConsentGranted(consentType) ? 'granted' : 'denied';
    });

    const eventName =
      data.useCustomEventName && data.customEventName
        ? data.customEventName
        : 'stape_consent_update';

    dataLayerDispatcher({
      event: eventName,
      consent: consentState
    });
  }

  typesToListen.forEach((consentType) => {
    addConsentListener(consentType, () => {
      if (flushScheduled) return;
      flushScheduled = true;
      callLater(flushConsentState);
    });
  });
}

/*==============================================================================
Helpers
==============================================================================*/

function shouldExitEarly(data) {
  const url = getUrl();

  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) {
    return true;
  }

  const isConsentTableValidArray =
    getType(data.specificConsentTypes) === 'array' && data.specificConsentTypes.length > 0;
  if (data.monitoredConsentScope === 'specificTypes' && !isConsentTableValidArray) {
    return true;
  }

  return false;
}
