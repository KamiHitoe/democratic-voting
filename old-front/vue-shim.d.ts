// import { Auth } from '@nuxtjs/auth'
import { NuxtAxiosInstance } from '@nuxtjs/axios';
import { Store } from 'vuex';

declare module '*.vue' {
  import Vue from 'vue'
  export default Vue
}

// declare module '@nuxt/types' {
//   interface Context {
//     $auth: Auth
//   }
// }
declare module '@nuxt/types' {
  interface Context {
    $axios: NuxtAxiosInstance;
    // $store: Object | Store;
    // $route: Object;
  }
}

declare module 'vue/types/vue' {
  interface Vue {
    $store: Object | Store;
    $route: any;
  }
}

// declare module '@vue/runtime-core' {
//   interface ComponentCustomProperties {
//     $store: Store;
//   }
// }