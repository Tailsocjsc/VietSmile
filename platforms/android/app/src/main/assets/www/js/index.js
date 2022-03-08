/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

// Wait for the deviceready event before using any of Cordova's device APIs.
// See https://cordova.apache.org/docs/en/latest/cordova/events/events.html#deviceready
document.addEventListener('deviceready', onDeviceReady, false);

function onDeviceReady() {
  // Cordova is now initialized. Have fun!
  window.location = 'https://vietsmile.com.vn/web/posts/';
  window.plugins.OneSignal.setAppId('d87a0ce5-bdd8-4137-9aa1-8a6ed032f5e6');
  window.plugins.OneSignal.setNotificationOpenedHandler(function (jsonData) {
    // window.location = jsonData.notification.rawPayload.custom.a.link;
    // alert(jsonData.notification.rawPayload.custom);
    let data = JSON.parse(jsonData.notification.rawPayload.custom);
    if (data && !!data.a && !!data.a.link) {
      //   alert(jsonData.notification.rawPayload.custom);
      window.location = data.a.link;
      // add link into Custom data OneSignal
      //   alert(JSON.stringify(jsonData.notification.rawPayload)); //ATTENTION: add alert will not navigation link
    }

    // if (
    //   jsonData.notification.rawPayload.aps &&
    //   jsonData.notification.rawPayload.aps.category
    // ) {
    //   window.location = jsonData.notification.rawPayload.aps.category;
    //   // add url into category OneSignal
    // }
  });
  window.plugins.OneSignal.promptForPushNotificationsWithUserResponse(function (
    accepted
  ) {
    console.log('User accepted notifications: ' + accepted);
  });

  window.open = cordova.InAppBrowser.open;
  console.log('Running cordova-' + cordova.platformId + '@' + cordova.version);
  document.getElementById('deviceready').classList.add('ready');
}
