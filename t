<!-- Imperial Style Loading Screen (Cleaner + Video Background) -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Imperial Network — Loading</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
:root {
  --black: #07080a;
  --panel: #0d0f12;
  --red: #e0001a;
  --red-glow: rgba(224, 0, 26, 0.55);
  --light: #d7d7d7;
  --soft: rgba(255,255,255,0.05);
}
html, body {
  margin: 0;
  padding: 0;
  width: 100%; height: 100%;
  overflow: hidden;
  background: var(--black);
  color: white;
  font-family: Inter, Arial, sans-serif;
}
/* ===== BACKGROUND VIDEO ===== */
.bg-video {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  overflow: hidden;
  z-index: -10;
  opacity: 0.45;
  filter: blur(3px) brightness(0.55);
}
.bg-video video {
  width: 100%; height: 100%;
  object-fit: cover;
}
/* ===== LAYOUT ===== */
.main-wrap {
  position: absolute;
  top: 50%; left: 50%;
  transform: translate(-50%, -52%);
  width: 85%; max-width: 1100px;
  display: flex; gap: 35px;
}
.card {
  flex: 1;
  background: var(--panel);
  border: 1px solid var(--soft);
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 0 40px rgba(0,0,0,0.6);
}
h1 {
  margin: 0 0 12px;
  font-size: 32px;
}
/* ===== LOADER ===== */
.loader {
  width: 150px; height: 150px;
  margin: 20px auto;
  border-radius: 50%;
  position: relative;
}
.loader-ring {
  position: absolute;
  inset: 0;
  border-radius: 50%;
  border: 3px solid var(--red);
  box-shadow: 0 0 18px var(--red-glow);
  animation: spin 2.8s linear infinite;
}
.loader-core {
  position: absolute;
  inset: 34px;
  background: #111318;
  border-radius: 50%;
  border: 2px solid rgba(255,255,255,0.06);
  display: flex; justify-content: center; align-items: center;
}
@keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }
/* ===== PROGRESS ===== */
.panel {
  background: #0b0d10;
  border: 1px solid var(--soft);
  padding: 18px;
  margin-top: 20px;
  border-radius: 8px;
}
#status { font-size: 18px; margin-bottom: 4px; }
#file { font-size: 13px; opacity: 0.75; margin-bottom: 8px; }

.progressbar {
  width: 100%; height: 12px;
  background: #1b1d22;
  border-radius: 999px;
  overflow: hidden;
  margin-top: 10px;
}
.progressline {
  height: 100%; width: 0%;
  background: var(--red);
  box-shadow: 0 0 14px var(--red-glow);
  transition: width .35s ease-out;
}
.progress-meta {
  margin-top: 10px;
  display: flex; justify-content: space-between;
  font-size: 13px;
  color: var(--light);
}
/* ===== RIGHT INFO BAR ===== */
.right-info {
  width: 260px;
  background: var(--panel);
  padding: 20px;
  border-radius: 12px;
  border: 1px solid var(--soft);
  box-shadow: 0 0 40px rgba(0,0,0,0.45);
}
.right-info h2 {
  color: var(--red);
  text-shadow: 0 0 12px var(--red-glow);
  font-size: 22px;
  margin-top: 0;
}
.info-line {
  margin: 8px 0;
  font-size: 15px;
  opacity: 0.85;
}
/* ===== BOTTOM PLAYER BAR ===== */
.bottom-bar {
  position: fixed;
  bottom: 0; left: 0; right: 0;
  height: 80px;
  background: #0f1114;
  border-top: 1px solid var(--soft);
  display: flex;
  align-items: center;
  padding: 0 25px;
  gap: 15px;
  box-shadow: 0 -4px 12px rgba(0,0,0,0.45);
}
.avatar {
  width: 58px; height: 58px;
  border-radius: 6px;
  background: #222;
  background-size: cover;
  background-position: center;
}
.player-name { font-size: 18px; font-weight: 600; }
.player-steam { font-size: 13px; opacity: 0.75; margin-top: 3px; }
/* ===== ANIMATIONS / MOTION ===== */
/* entrance */
.card{transform:translateY(18px);opacity:0;transition:transform .72s cubic-bezier(.2,.95,.2,1), opacity .6s ease}
.right-info{transform:translateY(6px);opacity:0;transition:transform .9s cubic-bezier(.2,.95,.2,1), opacity .7s ease}
.bottom-bar{transform:translateY(18px);opacity:0;transition:transform .7s cubic-bezier(.2,.95,.2,1), opacity .6s ease}
.panel, #file, #status, .progress-meta {opacity:0;transition:opacity .45s ease .2s}

/* visible state toggled by JS */
body.loaded .card{transform:translateY(0);opacity:1}
body.loaded .right-info{transform:translateY(0);opacity:1}
body.loaded .bottom-bar{transform:translateY(0);opacity:1}
body.loaded .panel, body.loaded #file, body.loaded #status, body.loaded .progress-meta{opacity:1}

/* loader glow pulse */
.loader-ring{box-shadow:0 0 18px var(--red-glow);}
@keyframes ringPulse{0%{box-shadow:0 0 10px rgba(224,0,26,0.08)}50%{box-shadow:0 0 34px rgba(224,0,26,0.28)}100%{box-shadow:0 0 10px rgba(224,0,26,0.08)}}
.loader-ring.pulse{animation: spin 2.8s linear infinite, ringPulse 1.9s ease-in-out infinite}

/* progress bump */
.progressline.bump{transform:translateY(-3px);box-shadow:0 0 26px var(--red-glow);transition:transform .18s ease, box-shadow .18s ease}
.bump{transform:translateY(-6px);transition:transform .22s cubic-bezier(.2,.9,.2,1)}

/* subtle float for right-info */
@keyframes floaty{0%{transform:translateY(0)}50%{transform:translateY(-6px)}100%{transform:translateY(0)}}
.right-info.float{animation:floaty 7s ease-in-out infinite}
</style>
</head>
<body>
<div class="bg-video">
  <video autoplay muted loop>
    <source src="https://cdn.pixabay.com/vimeo/276343549/space-16449.mp4" type="video/mp4" />
  </video>
</div>
<div class="main-wrap">
  <div class="card">
    <h1 id="servername">Infinity Gaming</h1>

    <div class="loader">
      <div class="loader-ring"></div>
      <div class="loader-core">
        <svg width="34" height="34" viewBox="0 0 24 24" stroke="var(--red)" fill="none" stroke-width="1.4">
          <circle cx="12" cy="12" r="8" />
        </svg>
      </div>
    </div>

    <div class="panel">
      <div id="status">Ładowanie...</div>
      <div id="file"></div>

      <div class="progressbar"><div id="progressline" class="progressline"></div></div>

      <div class="progress-meta">
        <div id="count">0 / 0</div>
        <div id="pct">0%</div>
      </div>
    </div>
  </div>

  <div class="right-info">
    <h2>INFORMACJE</h2>
    <div class="info-line" id="map-info">
  Mapa:
  <a href="https://example.com/path?Map=%m">https://example.com/path?Map=%m</a>
</div>
    <div class="info-line" id="players-info">Gracze: 0 / 0</div>
  </div>
</div>
<div class="bottom-bar">
  <div class="avatar" id="avatar"></div>
  <div>
    <div class="player-name" id="playername">User</div>
    <div class="player-steam" id="playersteam">SteamID: --</div>
  </div>
</div>
<audio id="music" src="https://cdn.pixabay.com/audio/2022/03/15/audio_8e3cf3a039.mp3" loop preload="auto"></audio>
<script>
function animateValue(el, start, end, duration){
  const startTime = performance.now();
  function tick(now){
    const t = Math.min(1, (now-startTime)/duration);
    // ease in-out
    const eased = t<0.5 ? 2*t*t : -1 + (4-2*t)*t;
    const v = Math.round(start + (end-start)*eased);
    el.textContent = v + "%";
    if(t < 1) requestAnimationFrame(tick);
  }
  requestAnimationFrame(tick);
}

// small visual helpers
function flashBump(){
  const line = document.getElementById('progressline');
  const pct = document.getElementById('pct');
  if(!line || !pct) return;
  line.classList.add('bump');
  pct.classList.add('bump');
  setTimeout(()=>{line.classList.remove('bump'); pct.classList.remove('bump');}, 360);
}

document.addEventListener('DOMContentLoaded', ()=>{
  // add loaded class for entrance transitions
  setTimeout(()=> document.body.classList.add('loaded'), 80);
  // make right-info gently float
  const ri = document.querySelector('.right-info'); if(ri) ri.classList.add('float');
  // give loader ring subtle pulse
  const ring = document.querySelector('.loader-ring'); if(ring) ring.classList.add('pulse');
});
window.GameDetails = function(name, url, map, maxplayers, steamid, gamemode, volume){
  document.getElementById("servername").textContent = name;
  document.getElementById("map-info").textContent = "Mapa: " + map;
  document.getElementById("players-info").textContent = `Gracze: 0 / ${maxplayers}`;
  document.getElementById("playersteam").textContent = "SteamID: " + steamid;
  document.getElementById("playername").textContent = "User";

  // Set avatar via SteamID
  if(steamid){
    document.getElementById("avatar").style.backgroundImage = 
      `url(https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/`+
      steamid.slice(-2).toLowerCase()+`/`+steamid+`_full.jpg)`;
  }

  let aud = document.getElementById("music");
  aud.volume = (typeof volume === 'number') ? volume : 0.35;
  aud.play().catch(()=>{});
};

window.SetFilesTotal = function(total){
  window._total = Number(total)||0;
  document.getElementById("progress").textContent = `Pliki: 0 / ${window._total}`;
  document.getElementById("count").textContent = `Pliki: 0 / ${window._total}`;
  document.getElementById("pct").textContent = "0%";
  document.getElementById("progressline").style.width = "0%";
};

window.SetFilesNeeded = function(needed){
  const n = Number(needed)||0;
  const dl = (window._total||0) - n;
  const pct = window._total>0 ? Math.round((dl/window._total)*100) : 0;

  document.getElementById("progress").textContent = `Pliki: ${dl} / ${window._total}`;
  document.getElementById("count").textContent = `Pliki: ${dl} / ${window._total}`;
  document.getElementById("players-info").textContent = `Gracze: ? / ?`; // No API for live count

  document.getElementById("progressline").style.width = pct + "%";
  animateValue(document.getElementById("pct"), Number(document.getElementById("pct").textContent.replace('%','')) || 0, pct, 420);
  // small visual feedback
  flashBump();
};

window.DownloadingFile = function(file){
  document.getElementById("file").textContent = file ? `Pobieranie: ${file}` : "";
};

window.SetStatusChanged = function(status){
  document.getElementById("status").textContent = status;
};
</script>
</body>
</html>
