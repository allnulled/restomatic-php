export default function(txtP, length, char = '0') {
    const txt = "" + txtP;
    const diffLength = length - txt.length;
    if(diffLength <= 0) {
        return txt;
    }
    let out = txt;
    for(let index = 0; index < diffLength; index++) {
        out = out + char;
    }
    return out;
}