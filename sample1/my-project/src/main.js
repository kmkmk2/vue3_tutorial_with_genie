import { createApp } from 'vue'; // Vue.js 3 の createApp 関数をインポート
import App from './App.vue'; // アプリケーションのメインコンポーネントをインポート

const app = createApp(App); // アプリケーションを生成

app.mount('#app'); // アプリケーションを #app の要素にマウント
