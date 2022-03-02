// import colors from 'vuetify/es5/util/colors'

export default {
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false, // this is SPA app

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: "Democratic Voting",
    // titleTemplate: '%s - frontend',
    htmlAttrs: {
      lang: "ja",
    },
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      { hid: "description", name: "description", content: "" },
      { name: "format-detection", content: "telephone=no" },
    ],
    link: [
      { rel: "icon", type: "image/x-icon", href: "/favicon.ico" },
      { rel: "stylesheet", type: "text/css", href: "https://www.gstatic.com/firebasejs/ui/6.0.0/firebase-ui-auth.css" },
    ],
    script: [
      { src: "https://www.gstatic.com/firebasejs/ui/6.0.0/firebase-ui-auth.js" }
    ],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  // plugins: ['@/plugins/helper.js'],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/typescript
    "@nuxt/typescript-build",
    // https://go.nuxtjs.dev/vuetify
    "@nuxtjs/vuetify",
    "@nuxtjs/dotenv",
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // you can use axios as this.$axios in any vue files
    "@nuxtjs/axios",
  ],

  // Vuetify module configuration: https://go.nuxtjs.dev/config-vuetify
  vuetify: {
    customVariables: ["~/assets/variables.scss"],
    theme: {
      dark: false,
      themes: {
        light: {
          primary: "#3f51b5",
          secondary: "#b0bec5",
          accent: "#8c9eff",
          error: "#b71c1c",
        },
      },
    },
    treeShake: false,
    optionsPath: "./vuetify.options.js",
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    // transpile: ['vuetify'],
  },

  server: {
    // port: 8080,
    port: 80,
  },

  // you can get endpoint URL as $axios in any vue files
  axios: {
    baseURL:
      process.env.NODE_ENV === "production"
        ? "https://www.miyukimiyuki.com/v1"
        : "http://localhost:3000/v1",
  },

  // proxy: {
  //   '/api/': { target: 'https://api.example.com/', pathRewrite: {'^/api/': ''}, changeOrigin: true }
  // },

  // typescript: {   
  //   typeCheck: {  
  //     typescript: {
  //       configFile: resolve(__dirname, 'tsconfig.nuxt.json'),   
  //       extensions: { vue: true },    
  //     },
  //   },
  // },
};
