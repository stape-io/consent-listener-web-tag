const addConsentListener = require('addConsentListener');
const createQueue = require('createQueue');
const getUrl = require('getUrl');
const getType = require('getType');

/*==============================================================================
==============================================================================*/

if (shouldExitEarly()) return data.gtmOnSuccess();

const dataLayerName =
  data.useCustomDataLayer && data.customDataLayerName ? data.customDataLayerName : 'dataLayer';
const eventName = data.customEventName && data.eventName ? data.eventName : 'stape_consent_update';
const dataLayerDispatcher = createQueue(dataLayerName);
const typesToListen = getUserConsentTypesSelection(data);

addConsentStatusListener(typesToListen);

data.gtmOnSuccess();

/*==============================================================================
Helpers
==============================================================================*/

function shouldExitEarly() {
  const url = getUrl();
  const isConsentTableValidArray =
    getType(data.consentTypeTable) === 'array' && data.consentTypeTable.length > 0;

  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) {
    return true;
  }
  if (!isConsentTableValidArray) {
    return true;
  }
  return false;
}

function getUserConsentTypesSelection(data) {
  const allTypesChosen = data.consentTypeTable.some(
    (consent) => consent.consentType === 'all_types'
  );

  const allConsentTypes = [
    'ad_storage',
    'ad_user_data',
    'ad_personalization',
    'analytics_storage',
    'functionality_storage',
    'personalization_storage',
    'security_storage'
  ];

  if (allTypesChosen) return allConsentTypes;
  else {
    return data.consentTypeTable.map((consent) => consent.consentType);
  }
}

function consentUpdateDispatcher(consentType, consentStatus) {
  dataLayerDispatcher({
    event: eventName,
    consent_type: consentType,
    consent_status: consentStatus ? 'granted' : 'denied'
  });
}

function addConsentStatusListener(typesToListen) {
  typesToListen.forEach((consentType) => {
    addConsentListener(consentType, consentUpdateDispatcher);
  });
}
