window.addEventListener('load', function() {
    var fadeOverlay = document.getElementById('fade-overlay');
    fadeOverlay.style.opacity = '0';
    setTimeout(function() {
        fadeOverlay.style.display = 'none';
    }, 1500); // 딜레이
});

window.addEventListener('beforeunload', function() {
    var fadeOverlay = document.getElementById('fade-overlay');
    fadeOverlay.style.display = 'block';
    fadeOverlay.style.opacity = '1';
});