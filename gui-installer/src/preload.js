const { ipcRenderer } = require('electron');

window.closeWindow = () => ipcRenderer.send('close-window');

console.log('preload script finally loaded!');