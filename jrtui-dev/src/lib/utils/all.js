import getRandomString from "./getRandomString.js";
import ajax from "./ajax.js";
import timeout from "./timeout.js";
import scrollToElement from "./scrollToElement.js";
import formatDate from "./formatDate.js";
import padStart from "./padStart.js";
import padEnd from "./padEnd.js";
import repeatString from "./repeatString.js";
import trace from "./trace.js";
import bindFunctionsToObject from "./bindFunctionsToObject.js";

export default bindFunctionsToObject({
    getRandomString,
    scrollToElement,
    timeout,
    trace,
    ajax,
    repeatString,
    formatDate,
    padStart,
    padEnd,
}, {});