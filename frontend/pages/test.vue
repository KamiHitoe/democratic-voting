<template>
  <main>
  <a target="_blank" href="https://twitter.com/intent/tweet?text=test">test twitter post</a>
  <button>
    <ShareNetwork
        network="twitter"
        url="https://lindaojo.com/blog/another-awesome-article"
        title="Another Awesome Article"
        description="This is another awesome article for awesome readers"
        twitter-user="LindaOjo_">
        <span>Share on Twitter</span>
    </ShareNetwork>
  </button>

  </main>
</template>

<script lang="ts">
import Vue from 'vue'
import VueSocialSharing from "vue-social-sharing"

Vue.use(VueSocialSharing)
export default Vue.extend({

})
</script>