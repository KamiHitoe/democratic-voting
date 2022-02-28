<template>
  <section>
    <h1 class="subtitle">ログインページ</h1>
    <div id="firebaseui-auth-container"></div>
    <!-- <div id="loader">Loading...</div> -->
  </section>
</template>

<script lang="ts">
import Vue from "vue";
import firebase from "@/plugins/firebase";

export default Vue.extend({
  data() {
    return {
    };
  },
  created() {
    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        // user is already signed in
        const target: Node = document.getElementById("firebaseui-auth-container");
        const text: Node = document.createTextNode("すでにログインしています");
        target.appendChild(text)
      } else {
        // No user is signed in
        this.firebaseUi();
      }
    })
  },
  methods: {
    firebaseUi() {
      // let firebase = require('firebase')
      let firebaseui = require('firebaseui');
      let ui = new firebaseui.auth.AuthUI(firebase.auth());
      let uiConfig = {
      callbacks: {
          signInSuccessWithAuthResult: function(authResult: any, redirectUrl: any) {
          // User successfully signed in.
          // Return type determines whether we continue the redirect automatically
          // or whether we leave that to developer to handle.
          console.log(authResult, redirectUrl);
          window.location.replace("/user-setting")
          return false;
          },
          uiShown: function() {
          // The widget is rendered.
          // Hide the loader.
          document.getElementById('loader').style.display = 'none';
          },
      },
      // Will use popup for IDP Providers sign-in flow instead of the default, redirect.
      signInFlow: 'popup',
      signInSuccessUrl: './',
      signInOptions: [
          // Leave the lines as is for the providers you want to offer your users.
          firebase.auth.EmailAuthProvider.PROVIDER_ID,
          firebase.auth.TwitterAuthProvider.PROVIDER_ID,
          firebase.auth.FacebookAuthProvider.PROVIDER_ID,
          firebase.auth.GoogleAuthProvider.PROVIDER_ID,
          // firebase.auth.GithubAuthProvider.PROVIDER_ID,
          // firebase.auth.PhoneAuthProvider.PROVIDER_ID
      ],
      // Terms of service url.
      tosUrl: '<your-tos-url>',
      // Privacy policy url.
      privacyPolicyUrl: '<your-privacy-policy-url>'
      };

      // The start method will wait until the DOM is loaded.
      ui.start('#firebaseui-auth-container', uiConfig);
    }
  },
});
</script>

<style lang="scss" scoped>
h1.subtitle {
  margin-bottom: 2rem;
}
</style>
