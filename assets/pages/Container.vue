<template lang="html">
  <div class="is-fullheight">
    <ul ref="events" class="events">
      <li v-for="item in messages" class="event" :key="item.key">
        <div v-if="item.html" v-html="item.html" style="white-space: pre;"></div>
        <div v-else>
          <span class="date">{{ item.dateRelative }}</span> <span class="text">{{ item.message }}</span>
        </div>
      </li>
    </ul>
    <scrollbar-notification :messages="messages"></scrollbar-notification>
    <vue-headful :title="title" />
  </div>
</template>

<script>
import { formatRelative } from "date-fns";
import ScrollbarNotification from "../components/ScrollbarNotification";
const prettyFactory = require("pino-pretty");
const Convert = require("ansi-to-html");

let es = null;
let nextId = 0;

const pretty = prettyFactory({
  colorize: true,
  translateTime: true,
  errorLikeObjectKeys: ["err", "error"]
});

const convert = new Convert({
  newline: true
});

const parseMessage = data => {
  const date = new Date(data.substring(0, 30));
  const dateRelative = formatRelative(date, new Date());
  const message = data.substring(30);
  const key = nextId++;
  let html;

  if (isStringJson(message)) {
    html = parsePinoMessage(message);
  }

  return {
    key,
    date,
    dateRelative,
    message,
    html
  };
};

const isStringJson = content => {
  try {
    JSON.parse(content);
  } catch (e) {
    return false;
  }
  return true;
};

const parsePinoMessage = message => {
  const ansi = pretty(message);
  return convert.toHtml(ansi);
};

export default {
  props: ["id", "name"],
  name: "Container",
  components: {
    ScrollbarNotification
  },
  data() {
    return {
      messages: [],
      title: ""
    };
  },
  created() {
    this.loadLogs(this.id);
  },
  beforeDestroy() {
    if (es) {
      es.close();
      es = null;
    }
  },
  watch: {
    id(newValue, oldValue) {
      if (oldValue !== newValue) {
        this.loadLogs(newValue);
      }
    }
  },
  methods: {
    loadLogs(id) {
      if (es) {
        es.close();
        es = null;
        this.messages = [];
      }
      es = new EventSource(`${BASE_PATH}/api/logs/stream?id=${id}`);
      es.onmessage = e => this.messages.push(parseMessage(e.data));
      this.title = `${this.name} - Dozzle`;
    }
  }
};
</script>
<style scoped>
.events {
  padding: 10px;
  font-family: "Roboto Mono", monaco, monospace;
}

.event {
  font-size: 13px;
  line-height: 16px;
  word-wrap: break-word;
}

.date {
  background-color: #262626;
  color: #258ccd;
}

.is-fullheight {
  min-height: 100vh;
}
</style>
