export default (time = 1000) => {
    return new Promise(ok => {
        setTimeout(ok, time);
    });
}