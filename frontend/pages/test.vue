<template>
  <section>
    <div>        
      <input type="file" id="fileUpload">    
    </div>    
    <div> 
      <button @click="s3upload">Submit</button>
    </div>
    <img src="https://test-democratic-img.s3.ap-northeast-1.amazonaws.com/chika01.jpg">

  </section>
</template>

<script lang="ts">
import Vue from "vue";
import global from "@/mixins";
import AWS from "aws-sdk";

export default Vue.extend({
  mixins: [
    global
  ],
  data() {
    return {
    };
  },
  async created() {
  },
  methods: {
    s3upload() {
      const bucketName = 'test-democratic-img';
      const region = 'ap-northeast-1';
      const s3 = new AWS.S3({
        params: { Bucket: bucketName },
        region: region,
      })

      AWS.config.update({
        accessKeyId: process.env.ACCESS_KEY_ID,
        secretAccessKey: process.env.SECRET_ACCESS_KEY,
      })

      const files = document.getElementById('fileUpload').files;

      if (files) {
        const file = files[0];
        const fileName = file.name;
        const fileURL = `https://${bucketName}.s3.${region}.amazonaws.com/${fileName}`
        console.log(fileURL);

        s3.putObject({
          Key: fileName,
          Body: file,
          ACL: 'public-read',
        }, function (err, data) {
          if (err) {
            return alert(err.message);
          }
          alert('success!');
        })
      }
    },
  },
});
</script>

<style lang="scss" scoped>

</style>
