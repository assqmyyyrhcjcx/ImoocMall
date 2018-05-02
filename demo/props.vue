<template>
  <div>
    父组件：
    <input v-model="val"><br/>
    子组件：
    <test v-bind:test-val="val"></test><br/>

    <add v-bind:btn="h"></add>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        msg: 'hello vue',
        val: "123",
        h: "111"
      }
    },
    components: {
      "test": {
        props: ['testVal'],
        template: "<input v-model='testVal'/>"
      },
      "add": {
        props: ['btn'],
        template: "<button>btn：{{btn}}</button>",
        data: function () {
          return {'btn': "123"};  //子组件同名的值被覆盖了
        }
      }
    }
  }
</script>
