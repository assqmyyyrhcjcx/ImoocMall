<template>
  <div>
    userid:{{$route.params.userid}}<br>
    goodsid:{{$route.params.goodsid}}<br>
    <router-link to="/goods/title">显示商品标题</router-link>
    <router-link to="/goods/image">显示商品图片</router-link>
    <div>
      <router-view></router-view>
    </div>
    <router-link to="/cart">跳转到购物车</router-link>
    <button @click="jump">button-跳转到购物车</button>
    <router-link v-bind:to="{name:'Cart', params:{cartid: 123}}">命名式跳转到购物车</router-link>
  </div>
</template>
<style>

</style>
<script>

  export default {
    data() {
      return {

      }
    },
    methods: {
      jump() {
//        this.$router.push("/cart");
        this.$router.push({path:"/cart?goodsid=123"});
//        this.$router.go(-2);
      }
    }
  }
</script>
