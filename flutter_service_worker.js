'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/images/profile.png": "9887fe8cc345edff2f825bb08659be5d",
"assets/assets/images/logo-white.png": "5046884b76a62f706bca4d9467c8891d",
"assets/assets/images/logo.png": "95be3e75ca2f8265b1b62f696dc0cebf",
"assets/assets/icons/onedrive.svg": "722465fba8dd85f173355a5f2a48260e",
"assets/assets/icons/menu_notification.svg": "55d727ebd9f15adb4c7fb04c042d2dbe",
"assets/assets/icons/google_drive.svg": "dbcf2ac3add890e0d10b180f30695f87",
"assets/assets/icons/pdf_file.svg": "e34db433ff4d67d1d1ed52bf148b012d",
"assets/assets/icons/media_file.svg": "a674ac5b4568415cfe9cfd3a746d74c0",
"assets/assets/icons/search.svg": "640a4234135e4750009b2ead02517585",
"assets/assets/icons/menu_store.svg": "9ec7dee98558e54c11f055a6f2a89de4",
"assets/assets/icons/doc_file.svg": "552a02a5a3dbaee682de14573f0ca9f3",
"assets/assets/icons/menu_doc.svg": "9d5fc7850ac9c858e123b0308a92856f",
"assets/assets/icons/documents.svg": "75f818d05a192c72bad158e89ec2b8db",
"assets/assets/icons/menu_settings.svg": "87cd72e88a2fcfee0ec0fb0de07648de",
"assets/assets/icons/logo.svg": "eee77f34fc27772a888361fef1585997",
"assets/assets/icons/menu_transaction.svg": "86d8a7329d5c7dcd29a6738ca000349c",
"assets/assets/icons/unknown.svg": "4d1cfbc98cc3655da3582324648ed7da",
"assets/assets/icons/folder.svg": "01aa599d1c81970cb6595c7656357cf7",
"assets/assets/icons/menu_dashboard.svg": "d788c8334e9c9b88531e56f121006a87",
"assets/assets/icons/menu_task.svg": "aeb41fdbdeccda47f9a6df09331e6de0",
"assets/assets/icons/xd_file.svg": "686504f938ecef28b0b2909eb2f63ea8",
"assets/assets/icons/dropbox.svg": "6bd5e198097151418e2b724eedddd853",
"assets/assets/icons/menu_profile.svg": "0d12b384b91edcc17b8dff9fd78a920d",
"assets/assets/icons/excel_file.svg": "65a5f41043d7ead06edc32e3d7e96819",
"assets/assets/icons/media.svg": "cce8037e4ea29041344073600a3ea132",
"assets/assets/icons/sound_file.svg": "ec4604acafb139ad24f08053609c6107",
"assets/assets/icons/figma_file.svg": "bf69927b5caf77b38d1b3a68b56d12a1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/images/loading.gif": "7a63480a257cdcc94fea9fa407908cbf",
"assets/AssetManifest.json": "e8d40d9d2a2d6748389e7d2404d18d32",
"assets/NOTICES": "49562a4258da2bfdea37df3c312b34c1",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"index.html": "c1d45f6b33bf43ccd29d13087cc0ea4e",
"/": "c1d45f6b33bf43ccd29d13087cc0ea4e",
"version.json": "4ba8bafca7a89c74d3b3441c7a0b759d",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"main.dart.js": "223d444196a14eb4526ea5b19ffdc475",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "4fdc326b638254b3e3a95927f5f06d08",
"canvaskit/profiling/canvaskit.js": "411ee45f5abb57975ee5243310c6953e",
"canvaskit/profiling/canvaskit.wasm": "c6681b1a749ad902eefcba11fed1cb3f",
"canvaskit/canvaskit.js": "f00de1f742223b7cf4cec1c2a0cd9764",
"canvaskit/canvaskit.wasm": "efe4a5da0205bb8d8c5aca7dad981abd"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
