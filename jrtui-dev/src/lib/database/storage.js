import metadata from "../../metadata.js";
import Storage from "./classes/Storage.js";

const storage = new Storage(metadata.settings.storage.id);

export default storage;