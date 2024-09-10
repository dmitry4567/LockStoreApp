'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "35db248e4acd2c7227e3f66e35b1c424",
"assets/AssetManifest.bin.json": "c6ee5d75b6754bd210c8ff42e4ef97ea",
"assets/AssetManifest.json": "41beefd215561892472d2f292ac8c6d5",
"assets/assets/fonts/RobotoFlex-Regular.ttf": "c1f174f3148d4539d0a8d41206cbdbf7",
"assets/assets/fonts/RobotoSerif-Regular.ttf": "2fde5a4a0cef2c19b4b6a30763322847",
"assets/assets/fonts/SF-Pro-Display-Light.otf": "ac5237052941a94686167d278e1c1c9d",
"assets/assets/fonts/SF-Pro-Display-Medium.otf": "51fd7406327f2b1dbc8e708e6a9da9a5",
"assets/assets/fonts/SF-Pro-Display-Regular.otf": "aaeac71d99a345145a126a8c9dd2615f",
"assets/assets/fonts/SF-Pro-Display-Semibold.otf": "e6ef4ea3cf5b1b533a85a5591534e3e4",
"assets/assets/icons/arrow_left.svg": "2370750d06e5f068b567a13c860f74b1",
"assets/assets/icons/arrow_right.svg": "87716c17195bb13998f8f886d0502e60",
"assets/assets/icons/box.svg": "7615a5da6dce8a1ba4dc4e45ca94456c",
"assets/assets/icons/heart.svg": "40ac1b18f588318405ed13348cfc7d79",
"assets/assets/icons/heart_pressed.svg": "e4337f0f35b91c8f88194374a40aefb7",
"assets/assets/icons/like.svg": "0494f665a4155b3b5bb9c6492c9bff77",
"assets/assets/icons/Logo.svg": "4042777cf30d319eddcc2099ae52c720",
"assets/assets/icons/menu.svg": "bd2601c6f7b2b6d09282a49ff12b8bc1",
"assets/assets/icons/minus.svg": "1fe75d42de26e3d473b8c4e60b711241",
"assets/assets/icons/phone.svg": "f9f727a97383e57e6da074e97eda7122",
"assets/assets/icons/plus.svg": "77a3ad6dc82e0b6afc300ba4681ec642",
"assets/assets/icons/productReturn.svg": "7615a5da6dce8a1ba4dc4e45ca94456c",
"assets/assets/icons/shop.svg": "9c3fd82ad75b6ebfb71b12c8cb34f9e4",
"assets/assets/icons/star_fill.svg": "a60b26da974cbb63f7a460b61653d46d",
"assets/assets/icons/star_unfill.svg": "88c6ededfc2bbb1ba8ce199dc859dfc4",
"assets/assets/images/lock1.jpg": "e42126b8a521a45e9708d2e987720397",
"assets/assets/images/lock2.png": "0d7c6a9ab19ff57355063edfc68db247",
"assets/assets/images/lock3.png": "869c8054fa8afb98ea8ee90e0ba66a06",
"assets/assets/images/lock4.png": "09d92ef264a16492ff9f5c00725e0481",
"assets/assets/images/lock5.png": "a70f3e6382f091e7b38cd9d8967d5b16",
"assets/FontManifest.json": "2ebdf9bd0323205b69a9afaccc80f664",
"assets/fonts/MaterialIcons-Regular.otf": "777af9bbde74b1a84b1e08cd1a1588c9",
"assets/NOTICES": "aac6204b612562a0b921dab2def8e52d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "aed964dd16c5de6fb88548b941a0168f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2b1c34562273fba304d266834dab949b",
"/": "2b1c34562273fba304d266834dab949b",
"main.dart.js": "b85733c08470d141b55529ca5b6ec4af",
"manifest.json": "421b66606a5a6b64a0f5242b8a057d10",
"version.json": "e1b3ec6ef52abf788dbae26105788950"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
