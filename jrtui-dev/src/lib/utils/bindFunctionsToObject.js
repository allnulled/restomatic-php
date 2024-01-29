export default function (obj, obj2 = {}) {
    for(let prop in obj) {
        if(typeof obj[prop] === "function") {
            obj2[prop] = obj[prop].bind(obj);
        } else {
            obj2[prop] = obj[prop];
        }
    }
    return obj2;
}