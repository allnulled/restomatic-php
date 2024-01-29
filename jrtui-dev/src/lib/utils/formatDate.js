export default function(date, format) {
    return format
        .replace("YYYY", date.getFullYear())
        .replace("MM", this.padStart(date.getMonth(), 2, '0'))
        .replace("DD", this.padStart(date.getDate(), 2, '0'))
        .replace("hh", this.padStart(date.getHours(), 2, '0'))
        .replace("mm", this.padStart(date.getMinutes(), 2, '0'))
        .replace("ss", this.padStart(date.getSeconds(), 2, '0'));
}