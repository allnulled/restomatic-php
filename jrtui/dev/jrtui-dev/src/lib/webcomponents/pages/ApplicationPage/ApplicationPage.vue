<template>
  <div class="ApplicationPage Component">
    <zlayouthorizontal>
      <zlayouthorizontalitem class="padding_1" style="min-width:110px;">
        <zformselect :initial-value="metodo" :on-change="v => metodo = v" :options="['GET','POST','PUT','DELETE','PATCH','HEAD','OPTIONS']">Método:</zformselect>
      </zlayouthorizontalitem>
      <zlayouthorizontalitem class="padding_1 width_100x100">
        <zformfield :initial-value="url" :on-change="v => url = v" placeholder="https://www.example.com">URL:</zformfield>
      </zlayouthorizontalitem>
    </zlayouthorizontal>
    <div class="padding_1">
      <zformtextarea :initial-value="cabeceras" :on-change="v => cabeceras = v">Cabeceras:</zformtextarea>
    </div>
    <div class="padding_1">
      <zformtextarea :initial-value="contenido" :on-change="v => contenido = v">Contenido:</zformtextarea>
    </div>
    <div class="padding_1">
      <button class="width_100x100" v-on:click="enviar_peticion">Enviar</button>
    </div>
    <div class="padding_1">
      <zformtextarea :initial-value="respuesta" :on-change="v => respuesta = v" ref="respuesta">Respuesta:</zformtextarea>
    </div>
  </div>
</template>
<script>
  export default {
    props: {},
    data() {
      return {
        metodo: "POST",
        url: "http://127.0.0.1:80",
        contenido: "{}",
        cabeceras: "{}",
        respuesta: ""
      };
    },
    methods: {
      asignar_respuesta(respuesta) {
        this.respuesta = respuesta;
      },
      async enviar_peticion() {
        try {
          const metodo = this.metodo;
          const url = this.url;
          const contenido = JSON.parse(this.contenido);
          const cabeceras = JSON.parse(this.cabeceras);
          const respuesta = await fetch(url, {
            method: metodo,
            headers: Object.assign({}, {"Content-Type": "application/json"}, cabeceras),
            body: JSON.stringify(contenido)
          });
          const conclusion = await respuesta.json();
          this.$refs.respuesta.value = JSON.stringify(conclusion, null, 4);
        } catch (error) {
          console.log(error);
          this.asignar_respuesta("Error: " + error.message);
        }
      }
    },
    watch: {},
    computed: {},
    beforeCreate() {},
    created() {},
    beforeMount() {},
    mounted() {},
    beforeUpdate() {},
    updated() {},
    beforeUnmount() {},
    unmounted() {},
  };
</script>
<style>
  
</style>