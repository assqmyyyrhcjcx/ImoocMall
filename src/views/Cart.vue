<template>
  <div>
    这是购物车
    <p>商品ID：{{$route.query.goodsid}}</p>
    <p>商品ID：{{$route.params.cartid}}</p>
  </div>
</template>
<style>

</style>
<script>

  export default {
    data() {
      return {
        msg: 'hello vue'
      }
    },

  }
</script>
