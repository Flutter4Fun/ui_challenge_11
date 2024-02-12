'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"main.dart.js": "68cc842662967129df08fc88677635d6",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"CNAME": "978e4055e87a70d01a13d9603206b723",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"index.html": "d32b38154483abe1ed8fcb7ea55f8285",
"/": "d32b38154483abe1ed8fcb7ea55f8285",
"version.json": "ce2cd74d016809e8dc749512a1443756",
"assets/AssetManifest.bin.json": "e138fa4721620289add1ffb536496dda",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/AssetManifest.bin": "6f411625699825d30fd047c6d143d3c1",
"assets/AssetManifest.json": "4a9bc793f108db4f9bd837164ed08dae",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "17ef40d87383468382df35ea2558b203",
"assets/assets/images/item1-1.png": "15bc7422f4e0a97464eeded36aec3075",
"assets/assets/images/item1-3.png": "75f772b913df48bb40ad4761638cef0c",
"assets/assets/images/item1-3-thumbnail.png": "b355b452cb6920a57beed961759d86fc",
"assets/assets/images/item1-5-thumbnail.png": "040616064f47abc49da95a1dc2e80eab",
"assets/assets/images/item1-2.png": "d4ff8cec038d774a394c62bd8dcc072d",
"assets/assets/images/item2-1.png": "dbe1ac301ce8f8aff8ef569546131ec0",
"assets/assets/images/item1-5.png": "838d98827c9d0f90cfc7773a38ac37e3",
"assets/assets/images/item3-1-thumbnail.png": "45753d0494ae1b626fea2a5a5dba640b",
"assets/assets/images/item1-4.png": "dda823ea02522171c2994edfbd0aba4c",
"assets/assets/images/item1-2-thumbnail.png": "2adbb51d4281e51f5a1601b5276a405b",
"assets/assets/images/item1-4-thumbnail.png": "6cb709ef0c950b39deeace0ea38f243b",
"assets/assets/images/item3-1.png": "3a4d71ca01850658f5b4b620601fa2d9",
"assets/assets/images/item1-1-thumbnail.png": "beb99338121668bd9749c1598092d0e2",
"assets/assets/images/item2-1-thumbnail.png": "66f2a45918069cc797d950b05be4de8d",
"assets/assets/icons/ic_search.svg": "be85663f2d8afeab8e70c9d47c8cd3c3",
"assets/assets/icons/ic_scan.svg": "16f72079d5aaffcebdcc2e3f2a87c1b2",
"assets/assets/icons/ic_heart.svg": "a513545bfde5e094588b4909b818fa4f",
"assets/assets/icons/ic_cowboy_hat.svg": "b5b6e06ec8377f140f513587a4963c20",
"assets/assets/icons/ic_arrow_back.svg": "007097c0e2089086387d31dbfdbec372",
"assets/assets/icons/ic_plus.svg": "b5d4ce29f0b685c438e01776ce752401",
"assets/assets/icons/ic_explore.svg": "a2f9581ce47cdb47b046a5bcf08dd49d",
"assets/assets/icons/ic_menu.svg": "b7ccf8497644591d431062c8257d6a6e",
"assets/assets/icons/ic_minus.svg": "452a74adbbd0a2ccb53f0f13cc3bf5bc",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "df11a172a89de3a4f9119c0713e29160"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
