import axios from "axios";
import metadata from "../../metadata.js";

const axiosInstance = axios.create({
    baseURL: metadata.settings.server.baseURL
});

export default axiosInstance;