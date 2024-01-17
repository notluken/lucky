// import {App} from './app.js';
import {Location} from './location.js';

export class Action {

  static set(pref) {
    // --- set action/browserAction
    let title = '', text = '';
    let color = '#fff';
    switch (pref.mode) {
      case 'disable':
        title = browser.i18n.getMessage('disable');
        text = '⛔';
        break;

      case 'direct':
        title = 'DIRECT';
        text = '⮕';
        break;

      case 'pattern':
        title = browser.i18n.getMessage('proxyByPatterns');
        text = '🌐';
        break;

      default:
        const item = pref.data.find(i => pref.mode === (i.type === 'pac' ? i.pac : `${i.hostname}:${i.port}`));
        if (item) {
          // Chrome 113-114 started having a bug showing unicode flags
          // const flag = App.getFlag(item.cc);
          // const host = flag + ' ' + [item.hostname, item.port].filter(Boolean).join(':');
          const host = [item.hostname, item.port].filter(Boolean).join(':');
          title = [host, item.city, ...Location.get(item.cc)].filter(Boolean).join('\n');
          // text = item.cc ? flag : item.hostname;
          text = item.title || item.hostname;
          color = item.color;
        }
    }

    browser.action.setBadgeBackgroundColor({color});
    browser.action.setTitle({title});
    browser.action.setBadgeText({text});
  }
}