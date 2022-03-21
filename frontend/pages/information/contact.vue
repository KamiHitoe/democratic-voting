<template>
  <section>
    <h3 class="header">お問い合わせ</h3>
    <p>本サイトに対する禁止行為の報告、不具合報告、その他お問い合わせは、以下管理人のTwitterアカウントまでお願い致します。</p>
    <a class="btn" target="_blank" href="https://twitter.com/starmiya_miyuki">
      <v-btn dark color="blue lighten-1">
        <v-icon>mdi-twitter</v-icon>
        <span class="lowercase">@starmiya_miyuki</span>
      </v-btn>
    </a>
  </section>
</template>

<style lang="scss" scoped>
section {
  @extend %section-body;
}
.header {
  margin-bottom: 1rem;
}
i {
  margin-right: 0.5rem;
}
.lowercase {
  text-transform: lowercase;
}
</style>
