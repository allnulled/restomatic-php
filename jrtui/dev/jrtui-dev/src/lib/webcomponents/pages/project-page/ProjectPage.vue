<template>
<div class="Component ProjectPage" v-if="project">
  <zjumbotron>{{ project.name }}</zjumbotron>
  <ztitle>{{ $t("Editing") }} <span style="float:right;"><button v-on:click="() => $router.back()">{{ $t("Back") }}</button></span></ztitle>
  <zsubtitle>{{ project.name }}</zsubtitle>
  <zlayoutnopaddingbottom>
    <zformtextarea :initial-value="project.contents" :on-change="(v) => project.contents = v">{{ $t("Edit the contents") }}:</zformtextarea>
  </zlayoutnopaddingbottom>
  <zseparator style="" />
  <zlayout>
    <button class="width_100x100" v-on:click="save_project">Guardar</button>
  </zlayout>
</div>
</template>

<script>
export default {
  props: {},
  data() {
    return {
      project: undefined
    };
  },
  methods: {
    async save_project() {
      try {
        const id_project = parseInt(this.$route.params.id_project);
        await this.$database.update("note", id_project, this.project);

      } catch (error) {
        this.$dialogs.error(error);
      }
    },
    async load_project() {
      try {
        const id_project = parseInt(this.$route.params.id_project);
        const matching_projects = await this.$database.select("note", note => note.id === id_project);
        this.$check.that(matching_projects).isArray();
        this.$check.that(matching_projects).hasLengthGreaterThan(0);
        const [ project ] = matching_projects;
        this.$check.that(project).isObject();
        this.project = project;
      } catch (error) {
        this.$dialogs.error(error);
      }
    }
  },
  watch: {},
  computed: {},
  beforeCreate() {},
  created() {},
  beforeMount() {},
  async mounted() {
    try {
      await this.load_project();
    } catch (error) {
      this.$dialogs.error(error);
    }
  },
  beforeUpdate() {},
  updated() {},
  beforeUnmount() {},
  unmounted() {},
};
</script>

<style>
  
</style>
