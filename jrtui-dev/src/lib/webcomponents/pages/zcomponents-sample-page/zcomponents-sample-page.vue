<template>
<div>

  <zpage title="autofocus directive">
    <input type="text" v-focus v-model="form_field" />
    <div><b>Current value:</b> {{ form_field }}</div>
  </zpage>

  <zpage title="ztabshorizontallayout">
    <ztabshorizontallayout :tabs="['Section 1', 'Section 2', 'Section 3']">
      <ztabpanel>
        <zfieldset legend="Form of section 1">
          <zformfield>Name:</zformfield>
          <zformfield>Surname:</zformfield>
          <zformnumber>Age:</zformnumber>
        </zfieldset>
      </ztabpanel>
      <ztabpanel>
        <zfieldset legend="Form of section 2">
          <zformfield>Name:</zformfield>
          <zformfield>Surname:</zformfield>
          <zformnumber>Age:</zformnumber>
        </zfieldset>
      </ztabpanel>
      <ztabpanel>
        <zfieldset legend="Form of section 3">
          <zformfield>Name:</zformfield>
          <zformfield>Surname:</zformfield>
          <zformnumber>Age:</zformnumber>
        </zfieldset>
      </ztabpanel>
    </ztabshorizontallayout>
  </zpage>

  <zpage title="ztabslayout">
    <ztabslayout :tabs="['Section 1', 'Section 2', 'Section 3']">
      <ztabpanel>
        <zfieldset legend="Form of section 1">
          <zformfield>Name:</zformfield>
          <zformfield>Surname:</zformfield>
          <zformnumber>Age:</zformnumber>
        </zfieldset>
      </ztabpanel>
      <ztabpanel>
        <zfieldset legend="Form of section 2">
          <zformfield>Name:</zformfield>
          <zformfield>Surname:</zformfield>
          <zformnumber>Age:</zformnumber>
        </zfieldset>
      </ztabpanel>
      <ztabpanel>
        <zfieldset legend="Form of section 3">
          <zformfield>Name:</zformfield>
          <zformfield>Surname:</zformfield>
          <zformnumber>Age:</zformnumber>
        </zfieldset>
      </ztabpanel>
    </ztabslayout>
  </zpage>

  <zpage title="zformsearchbox">
    <zformsearchbox :on-search="(v, component) => $dialogs.inform(v)" />
  </zpage>

  <zpage title="zfieldset zlegend">
    <zlayout>
      <zfieldset legend="Group A of buttons:">
        <zformfield>Name:</zformfield>
      </zfieldset>
      <zfieldset>
        <zlegend>Group B of buttons:</zlegend>
        <zpanel>
          <zformfield>Name:</zformfield>
        </zpanel>
      </zfieldset>
      <zfieldset legend="Group C of buttons:">
        <zformfield>Name:</zformfield>
      </zfieldset>
    </zlayout>
  </zpage>

  <zpage title="dialogs by script tag">
    <script id="dialogo_1" type="text/template">
      <zformfield name="name">Name:</zformfield>
      <zformfield name="surname">Surname:</zformfield>
      <zformfield name="direction">Direction:</zformfield>
      <zformfield name="telephone">Telephone:</zformfield>
      <zformfield name="email">Email:</zformfield>
      <zformfield name="id_number">ID number:</zformfield>
      <zseparator />
      <zbutton>Send</zbutton>
    </script>
    <span v-on:click="open_dialogo_uno">
      <zbutton>Dialog one</zbutton>
    </span>
  </zpage>

  <zpage title="ztree">
    <ztree class="">
      <details open>
        <summary>Node 1</summary>
        <ztreenode>
          <ztreeitem>
            <details>
              <summary>Node 1.1</summary>
              <ztreenode>
                <ztreeitem>Node 1.1.1</ztreeitem>
                <ztreeitem>Node 1.1.2</ztreeitem>
                <ztreeitem>Node 1.1.3</ztreeitem>
              </ztreenode>
            </details>
          </ztreeitem>
          <ztreeitem>
            <details>
              <summary>Node 1.2</summary>
              <ztreenode>
                <ztreeitem>Node 1.2.1</ztreeitem>
                <ztreeitem>Node 1.2.2</ztreeitem>
                <ztreeitem>Node 1.2.3</ztreeitem>
              </ztreenode>
            </details>
          </ztreeitem>
          <ztreeitem>
            <details>
              <summary>Node 1.3</summary>
              <ztreenode>
                <ztreeitem>Node 1.3.1</ztreeitem>
                <ztreeitem>Node 1.3.2</ztreeitem>
                <ztreeitem>Node 1.3.3</ztreeitem>
              </ztreenode>
            </details>
          </ztreeitem>
        </ztreenode>
      </details>
    </ztree>
  </zpage>

  <zpage title="badgeviewer">
    <span v-on:click="() => {$badges.send({ title: 'Example of badge', message: 'This is a badge.' })}">
      <zbutton>Example of badge</zbutton>
    </span>
  </zpage>

  <zpage title="zmenubar" id="menubar">
    <zmenubar>
      <zmenubaritem>
        <zlink>one</zlink>
        <zmenu>
          <zmenuitem>
            <img src="https://img.icons8.com/color/18/000000/monitor--v1.png" />
            <zlink>one.one <span style="float:right;">▸</span></zlink>
            <zmenu>
              <zmenuitem>
                <zlink>one.one.one <span style="float:right;">▸</span></zlink>
                <zmenu>
                  <zmenuitem>
                    <zlink href="#menubar">one.one.one.one</zlink>
                  </zmenuitem>
                  <zmenuitem>
                    <zlink href="#menubar">one.one.one.two</zlink>
                  </zmenuitem>
                  <zmenuitem>
                    <zlink href="#menubar">one.one.one.three</zlink>
                  </zmenuitem>
                </zmenu>
              </zmenuitem>
              <zmenuitem>
                <zlink href="#menubar">one.one.two</zlink>
              </zmenuitem>
              <zmenuitem>
                <zlink href="#menubar">one.one.three</zlink>
              </zmenuitem>
            </zmenu>
          </zmenuitem>
          <zmenuitem>
            <zlink href="#menubar">one.two</zlink>
          </zmenuitem>
          <zmenuitem>
            <zlink href="#menubar">one.three</zlink>
          </zmenuitem>
        </zmenu>
      </zmenubaritem>
      <zmenubaritem>
        <zlink>two</zlink>
        <zmenu>
          <zmenuitem>
            <zlink href="#menubar">two.one</zlink>
          </zmenuitem>
          <zmenuitem>
            <zlink href="#menubar">two.two</zlink>
          </zmenuitem>
          <zmenuitem>
            <zlink href="#menubar">two.three</zlink>
          </zmenuitem>
        </zmenu>
      </zmenubaritem>
      <zmenubaritem>
        <zlink>three</zlink>
        <zmenu>
          <zmenuitem>
            <zlink href="#menubar">three.one</zlink>
          </zmenuitem>
          <zmenuitem>
            <zlink href="#menubar">three.two</zlink>
          </zmenuitem>
          <zmenuitem>
            <zlink href="#menubar">three.three</zlink>
          </zmenuitem>
        </zmenu>
      </zmenubaritem>
    </zmenubar>
  </zpage>

  <zpage title="zmenu" id="menu">
    <zmenu style="max-width:200px;">
      <zmenuitem>
        <zlink>One.one <span style="float:right;">▸</span></zlink>
        <zmenu style="max-width:200px;">
          <zmenuitem>
            <zlink href="#menu">One.one.one</zlink>
          </zmenuitem>
          <zmenuitem>
            <zlink href="#menu">One.one.two</zlink>
          </zmenuitem>
          <zmenuitem>
            <zlink href="#menu">One.one.three</zlink>
          </zmenuitem>
        </zmenu>
      </zmenuitem>
      <zmenuitem>
        <zlink href="#menu">One.two</zlink>
      </zmenuitem>
      <zmenuitem class="has-divider">
        <zlink href="#menu">One.three</zlink>
      </zmenuitem>
      <zmenuitem aria-disabled="true">
        <zlink href="#menu">One.four</zlink>
      </zmenuitem>
      <zmenuitem aria-disabled="true" class="has-divider">
        <zlink href="#menu">One.five</zlink>
      </zmenuitem>
      <zmenuitem>
        <img src="https://img.icons8.com/color/18/000000/monitor--v1.png" />
        <zlink href="#menu">One.six</zlink>
      </zmenuitem>
      <zmenuitem>
        <img src="https://img.icons8.com/color/18/000000/monitor--v1.png" />
        <zlink href="#menu">One.seven</zlink>
      </zmenuitem>
    </zmenu>
  </zpage>

  <zpage title="zjumbotron">
    <zjumbotron>
      zjumbotron
    </zjumbotron>
  </zpage>

  <zpage title="ztitle">
    <ztitle>ztitle</ztitle>
  </zpage>

  <zpage title="zsubtitle">
    <zsubtitle>zsubtitle</zsubtitle>
  </zpage>

  <zpage title="zwindow">
    <zwindow>
      <zwindowtitle>
        zwindowtitle
      </zwindowtitle>
      <zwindowbody>
        zwindowbody
      </zwindowbody>
      <zwindowfooter>
        <zwindowfooteritem>
          zwindowfooteritem
        </zwindowfooteritem>
        <zwindowfooteritem>
          zwindowfooteritem
        </zwindowfooteritem>
      </zwindowfooter>
    </zwindow>
  </zpage>

  <zpage title="zbiglist">
    <zbiglist>
      <zbiglistitem>zbiglisitem</zbiglistitem>
      <zbiglistitem>zbiglisitem</zbiglistitem>
      <zbiglistitem>zbiglisitem</zbiglistitem>
    </zbiglist>
  </zpage>

  <zpage title="ztooltip">
    <ztooltip class="is-bottom is-right">
      .is-bottom.is-right
    </ztooltip>
    <div style="height:40px;"></div>
    <ztooltip class="is-bottom is-left">
      .is-bottom.is-left
    </ztooltip>
    <div style="height:40px;"></div>
    <ztooltip class="is-top is-left">
      .is-top.is-left
    </ztooltip>
    <div style="height:40px;"></div>
    <ztooltip class="is-top is-right">
      .is-top.is-right
    </ztooltip>
    <div style="height:40px;"></div>
  </zpage>

  <zpage title="ztable">
    <ztable>
      <ztablehead>
        <ztablerow>
          <ztableheader>ztableheader</ztableheader>
          <ztableheader>ztableheader</ztableheader>
          <ztableheader>ztableheader</ztableheader>
        </ztablerow>
      </ztablehead>
      <ztablebody>
        <ztablerow>
          <ztablecell>ztablecell</ztablecell>
          <ztablecell>ztablecell</ztablecell>
          <ztablecell>ztablecell</ztablecell>
        </ztablerow>
      </ztablebody>
    </ztable>
  </zpage>

  <zpage title="zspinner">
    <zspinner></zspinner>
  </zpage>

  <zpage title="zseparator">
    <zseparator style="min-width: 50px;"></zseparator>
  </zpage>

  <zpage title="zprogressbar">
    <zprogressbar style="min-width: 50px;"></zprogressbar>
  </zpage>

  <zpage title="zpill">
    <zpill>zpill</zpill>
    <zpill>zpill</zpill>
    <zpill>zpill</zpill>
  </zpage>
  
  <zpage title="zparagraph">
    <zparagraph>zparagraph</zparagraph>
  </zpage>
  
  <zpage title="zonscreendependant">
    <zonscreendependant>
      <zonscreenxs>zonscreenxs</zonscreenxs>
      <zonscreensm>zonscreensm</zonscreensm>
      <zonscreenmd>zonscreenmd</zonscreenmd>
      <zonscreenlg>zonscreenlg</zonscreenlg>
      <zonscreenxl>zonscreenxl</zonscreenxl>
    </zonscreendependant>
  </zpage>

  <zpage title="zlink">
    <zlink link="https://www.example.com">https://www.example.com</zlink>
  </zpage>

  <zpage title="zlayoutvertical">
    <zlayoutvertical>
      <zlayoutverticalitem>1</zlayoutverticalitem>
      <zlayoutverticalitem>2</zlayoutverticalitem>
      <zlayoutverticalitem>3</zlayoutverticalitem>
    </zlayoutvertical>
  </zpage>

  <zpage title="zlayouthorizontal">
    <zlayouthorizontal>
      <zlayouthorizontalitem>1</zlayouthorizontalitem>
      <zlayouthorizontalitem>2</zlayouthorizontalitem>
      <zlayouthorizontalitem>3</zlayouthorizontalitem>
    </zlayouthorizontal>
  </zpage>

  <zpage title="zformfield">
    <zformfield  :on-change="v => form_field = v"></zformfield>
    <div><b>Current value:</b> {{ form_field }}</div>
  </zpage>

  <zpage title="zformnumber">
    <zformnumber  :on-change="v => form_number = v"></zformnumber>
    <div><b>Current value:</b> {{ form_number }}</div>
  </zpage>

  <zpage title="zformtextarea">
    <zformtextarea :on-change="v => form_textarea = v"></zformtextarea>
    <div><b>Current value:</b> {{ form_textarea }}</div>
  </zpage>

  <zpage title="zformselect">
    <zformselect :options="['One','Two','Three']" :on-change="v => form_select = v"></zformselect>
    <div><b>Current value:</b> {{ form_select }}</div>
  </zpage>

  <zpage title="zformrange">
    <zformrange :step="10" :on-change="v => form_range = v"></zformrange>
    <div><b>Current value:</b> {{ form_range }}</div>
  </zpage>

  <zpage title="zformcombobox">
    <zformcombobox :initial-value="form_combobox" :on-change="v => form_combobox = v" :options="['Inicial', 'Procesando', 'Final']"></zformcombobox>
    <div><b>Current value:</b> {{ form_combobox }}</div>
  </zpage>

  <zpage title="zformcheckboxes">
    <zformcheckboxes :initial-value="form_checkboxes" :on-change="v => form_checkboxes = v" :options="['Inicial', 'Procesando', 'Final']"></zformcheckboxes>
    <div><b>Current value:</b> {{ form_checkboxes }}</div>
  </zpage>

  <zpage title="zformcheckbox">
    <zformcheckbox :initial-value="form_checkbox" :on-change="v => form_checkbox = v"></zformcheckbox>
    <div><b>Current value:</b> {{ form_checkbox }}</div>
  </zpage>

  <zpage title="vuejscalendario">
    <vuejscalendario mode="datetime"></vuejscalendario>
  </zpage>

  <zpage title="zformdatetime">
    <zformdatetime>zformdatetime:</zformdatetime>
  </zpage>

  <zpage title="zformdate">
    <zformdate>zformdate:</zformdate>
  </zpage>

  <zpage title="zformtime">
    <zformtime>zformtime:</zformtime>
  </zpage>

  <zpage title="zbreadcrumb">
    <zbreadcrumb>
      <zlink>Inicio</zlink>
      <span> » </span>
      <zlink>Programas</zlink>
      <span> » </span>
      <zlink>Uno</zlink>
    </zbreadcrumb>
  </zpage>

  <zpage title="example of standard presentation">
    <zjumbotron>Jumbotron</zjumbotron>
    <ztitle>Title</ztitle>
    <zsubtitle>Subtitle</zsubtitle>
    <zbreadcrumb style="font-size: 11px;">
      <zlink>Inicio</zlink>
      <span> » </span>
      <zlink>Programas</zlink>
      <span> » </span>
      <zlink>Uno</zlink>
    </zbreadcrumb>
  </zpage>

  <zpage title="zbutton">
    <span v-on:click="() => {this.$window.alert('hi')}">
      <zbutton>zbutton</zbutton>
    </span>
  </zpage>

  <zpage title="zcollapsible">
    <zcollapsible style="padding-left: 15px;">
      <zcollapser>1. zcollapser</zcollapser>
      <zlist>
        <zlistitem>
          <zcollapsible style="padding-left: 15px;">
            <zcollapser>1.1</zcollapser>
            <zlist>
              <zlistitem>
                <zcollapsible style="padding-left: 15px;">
                  <zcollapser>1.1.1</zcollapser>
                </zcollapsible>
              </zlistitem>
            </zlist>
          </zcollapsible>
        </zlistitem>
      </zlist>
    </zcollapsible>
  </zpage>

  <zpage title="zdialogport">
    <zdialogport />
    <zlayouthorizontal>
      <zlayouthorizontalrow>
        <zlayouthorizontalitem>
          <button v-on:click="() => $dialogs.form('Form dialog <button>ok</button>')">Form example</button>
          <button v-on:click="() => $dialogs.confirm('Confirm dialog')">Confirm example</button>
          <button v-on:click="() => $dialogs.inform('Inform dialog')">Inform example</button>
        </zlayouthorizontalitem>
      </zlayouthorizontalrow>
      <zlayouthorizontalrow>
        <zlayouthorizontalitem>
          <button v-on:click="() => $dialogs.form('Custom dialog <button>ok</button>')">Form example</button>
          <button v-on:click="() => $dialogs.confirm('Confirm dialog')">Confirm example</button>
          <button v-on:click="() => $dialogs.inform('Inform dialog')">Inform example</button>
        </zlayouthorizontalitem>
      </zlayouthorizontalrow>
    </zlayouthorizontal>
  </zpage>

  <zpage title="ztabslayout">
    <ztabslayout :tabs="['One', 'Two', 'Three']">
      <ztabpanel>ztabpanel of One</ztabpanel>
      <ztabpanel>ztabpanel of Two</ztabpanel>
      <ztabpanel>ztabpanel of Three</ztabpanel>
    </ztabslayout>
  </zpage>

</div>
</template>

<script>
export default {
  props: {},
  data() {
    return {
      form_field: "",
      form_number: 0,
      form_textarea: "",
      form_select: "",
      form_range: 50,
      form_combobox: "Inicial",
      form_checkboxes: ["Inicial"],
      form_checkbox: false
    };
  },
  methods: {
    async open_dialogo_uno() {
      const resultado = await this.$dialogs.form(this.$window.document.getElementById('dialogo_1').innerHTML);
      console.log(resultado);
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
